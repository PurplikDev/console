extends Node

@onready var theme: Theme = preload("res://resources/console_theme.tres")

func _ready() -> void:
	pass

func set_text_color(color: Color) -> void:
	theme.set_color("font_color", "LineEdit", color)
	theme.set_color("default_color", "RichTextLabel", color)

func get_text_color() -> Color:
	return theme.get_color("font_color", "LineEdit")
