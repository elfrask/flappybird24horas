extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	loadscore()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
var Points = 0
var BestScore = 0
var DieMenu: Node

func reset():
	
	Points = 0
	

func savescore():
	var fs = FileAccess.open("user://score.json", FileAccess.WRITE)
	var data= {
		"BestScore": BestScore
	}
	
	var json = JSON.new()
	
	var cadena = json.stringify(data)
	
	fs.store_string(cadena)
	
	pass

func loadscore():
	if FileAccess.file_exists("user://score.json"):
		var fs = FileAccess.open("user://score.json", FileAccess.READ)
		var json = JSON.new()
		var cadena = fs.get_as_text()
		var data = json.parse_string(cadena)
		
		BestScore = data["BestScore"]
	
	
	pass

