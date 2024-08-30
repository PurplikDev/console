class_name list
extends Command

func _ready() -> void:
	description = "lists all available commands in a module"

func call_command(_args: Array[String]):
	for child in get_parent().get_children():
		if child is Command:
			Console.print_line(str(child.name, " - ", child.description))
