extends Node2D

@export var PLAYER: NodePath
@export var DistanceFloor:int = 154
@export var DistanceBackgroud: int = 144
@export var DistancePipe: int = 150
@export var ScaleEOF: int = 2



@onready var placeholder_BG: Node2D = $bg
@onready var placeholder_SUELO: Node2D = $suelo
@onready var placeholder_TECHO: Node2D = $techo
@onready var placeholder_PIPE: Node2D = $Pipes



@onready var BG = load("res://nodes/bg.tscn")
@onready var SUELO = load("res://nodes/suelo.tscn")
@onready var PIPE = load("res://nodes/pipe.tscn")

@onready var minEofDistanceBG = DistanceBackgroud * ScaleEOF
@onready var minEofDistanceFloor = DistanceFloor * ScaleEOF
@onready var minEofDistancePipe = DistancePipe * ScaleEOF

# Called when the node enters the scene tree for the first time.
func _ready():
	GAME.reset()
	for i in range(0, 2):
		_next_bg()
		_next_suelo()
		_next_pipe()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var Player: Node2D = get_node(PLAYER)
	var POS = Player.global_position.x
	
	
	
	#print(POS)
	
	pass
	
func _next(trigger: Node2D, long: int= 0, NewScene: PackedScene = PackedScene.new(), XPos:int = 0, YPos:int = 0, placeholder: Node2D = Node2D.new()):
	trigger.position.x += long
	
	var duplicado = NewScene.instantiate()
	placeholder.call_deferred("add_child", duplicado)
	duplicado.position.x = XPos
	duplicado.position.y = YPos
	
	
	pass

var nextXPosBG = 0
var nextXPosFloor = 0
var nextXPosPipe = 0

func _next_bg():
	_next($bg/generate, DistanceBackgroud, BG, nextXPosBG, 0, placeholder_BG)
	nextXPosBG += DistanceBackgroud
func _next_suelo():
	_next($suelo/generate_suelo, DistanceFloor, SUELO, nextXPosFloor, 0, placeholder_SUELO)
	_next($suelo/generate_suelo, 0, SUELO, nextXPosFloor, 0, placeholder_TECHO)
	nextXPosFloor += DistanceFloor
	
func _next_pipe():
	
	var Ypos = 0
	
	var random = int(randi()%10)
	
	var UP = $Pipes/up.position.y
	var DOWN = $Pipes/down.position.y
	
	var relative = DOWN - UP
	
	Ypos = int(relative * (random * 0.1)) + UP
	
	_next($Pipes/gen_pipe, DistancePipe, PIPE, nextXPosPipe, Ypos, placeholder_PIPE)
	nextXPosPipe += DistancePipe

func _on_generate_body_entered(body):
	
	if body is CharacterBody2D:
		if body.is_in_group("player"):
			#print("Hola")
			_next_bg()
			pass
		pass
	pass # Replace with function body.


func _on_generate_suelo_body_entered(body):
	if body is CharacterBody2D:
		if body.is_in_group("player"):
			#print("Hola")
			
			_next_suelo()
			pass
		pass
	pass # Replace with function body.


func _on_gen_pipe_body_entered(body):
	if body is CharacterBody2D:
		if body.is_in_group("player"):
			#print("Hola")
			
			_next_pipe()
			pass
		pass
	pass # Replace with function body.
