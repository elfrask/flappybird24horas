extends CharacterBody2D

enum modes {
	noStarter,
	game,
	die
}

var state = modes.noStarter


var JUMP = 200
var SPEED = 70
var GRAVITY = 10
var LIMIT_FALL_SPEED
var normalize_delta = 100

func _ready():
	
	$ani.play("play")
	
	pass
	
func _process(delta):
	
	match state:
		modes.noStarter:
			_intro(delta)
			pass
		modes.game:
			_game(delta)
			pass
		modes.die:
			_die(delta)
		
	
	
	pass

func _intro(delta):
	if Input.is_action_just_pressed("jump"):
		velocity.y = -JUMP 
		state = modes.game
	
	pass
	
func die():
	$ani.play("die")
	state = modes.die
	$hit.play(0)
	pass

func open_die_menu():
	GAME.DieMenu.gameover()
	pass

func _game(delta):
	
	velocity.y += GRAVITY 
	velocity.x = SPEED
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = -JUMP 
		$fly.play(0)
	
	
	
	move_and_slide()
	
	if velocity.x == 0:
		die()
	if $down.is_colliding() or $up.is_colliding():
		die() 
	
	pass
	
func _die(delta):
	
	pass
