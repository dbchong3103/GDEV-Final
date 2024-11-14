extends Area2D

@onready var knight: CharacterBody2D = $"../Knight"

func _on_body_entered(body: CharacterBody2D) -> void:
	queue_free()
