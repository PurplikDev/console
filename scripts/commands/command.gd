class_name Command
extends Node

@export_multiline var description: String

func call_command(args: Array[String]):
	Console.print_line("missing command behavior")
