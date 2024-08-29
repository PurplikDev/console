extends LineEdit

@onready var console: Console = %Console
@onready var console_key_audio: AudioStreamPlayer = %ConsoleKeyAudio
@onready var console_input_audio: AudioStreamPlayer = %ConsoleInputAudio

func _ready() -> void:
	grab_focus()
	
	text_changed.connect(type)
	text_submitted.connect(submit)

func type(_cmd: String):
	console_key_audio.play()
	console_key_audio.pitch_scale = 1 + randf_range(-0.125, 0.125)

func submit(cmd: String):
	if !cmd.is_empty():
		console.command(text.to_lower())
		text = ""
		console_input_audio.play()
		console_input_audio.pitch_scale = 1 + randf_range(-0.25, 0.25)
