extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_free_body_entered(body):
	if body is CharacterBody2D:
		if body.is_in_group("player"):
			
			queue_free()
		pass
	pass # Replace with function body.


func _on_point_body_entered(body):
	if body is CharacterBody2D:
		if body.is_in_group("player"):
			
			GAME.Points += 1
		pass
	pass # Replace with function body.
