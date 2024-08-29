class_name Console
extends Node

static var console_output: RichTextLabel
static var console_output_timer: Timer
static var console_output_audio: AudioStreamPlayer

static var requests: Array[String]

var modules: Dictionary: # switch to using a dictionary { string : module }
	get:
		var mods = {}
		for child in get_children():
			if child is Module:
				mods[child.name] = child as Module
		return mods

func _ready() -> void:
	console_output = %ConsoleOutput
	console_output_timer = %ConsoleOutputTimer
	console_output_audio = %ConsoleOutputAudio
	console_output_timer.timeout.connect(append_line)
	# append_line("welcome to the game")

func command(cmd: String) -> void:
	var result: PackedStringArray = cmd.split(".")
	print_line(str("< ", cmd), false)
	if modules.has(result[0]):
		modules[result[0]].command(cmd)
	else:
		print_error("invalid command", cmd)

static func append_line():
	if requests.size() > 0:
		console_output.append_text(str(requests[0], "\n"))
		if requests[0][0] == ">":
			console_output_audio.play()
		requests.remove_at(0)
		console_output_timer.wait_time = randf_range(0.25, 0.5)
		console_output_timer.start()

static func print_error(error: String, argument: String) -> void:
	print_line("[color=red]%s[/color] '%s'" % [error, argument])
	print_line("[color=red]write 'help' for help[/color]")
	
	if console_output_timer.is_stopped():
		append_line()

static func print_line(text: String, arrow: bool = true) -> void:
	text = text.to_lower()
	var lines = text.split("\n")
	for line in lines:
		if arrow:
			line = str("> ",line)
		else:
			line = str(line)
		requests.append(line)
	if console_output_timer.is_stopped():
		console_output_timer.start()
		append_line()
