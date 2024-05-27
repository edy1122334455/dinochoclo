extends Node2D

var screen_size : Vector2i

var PlayerInitialPoosition

func _ready():
	screen_size = get_window().size
	PlayerInitialPoosition = $Player.position


func _process(delta):
	$Floor.position.x = $Player.position.x - 150
