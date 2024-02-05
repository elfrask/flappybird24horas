extends CharacterBody2D



func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		if body.is_in_group("player"):
			
			queue_free()
		pass
	pass # Replace with function body.
