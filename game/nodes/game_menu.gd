extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$ct.visible = true
	$ani.play("RESET")
	GAME.DieMenu = self
	pass # Replace with function body.

func gameover():
	$ct/Label.visible = false
	$ani.play("play")
	if GAME.Points > GAME.BestScore:
		GAME.BestScore = GAME.Points
	
	$ct/Control/ColorRect/points.text = str(GAME.Points)
	$ct/Control/ColorRect/maxpoints.text = str(GAME.BestScore)
	
	GAME.savescore()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ct/Label.text = "Puntos: " + str(GAME.Points)
	pass


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://nodes/menu.tscn")
	pass # Replace with function body.


func _on_trygain_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.
