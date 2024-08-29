extends Node

@export var noise: NoiseTexture2D

func _process(_delta: float) -> void:
	noise.noise.seed = randi()
