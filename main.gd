extends Node2D

var screen_size : Vector2i

var PlayerInitialPoosition

func _ready():
	screen_size = get_window().size
	PlayerInitialPoosition = $Player.position

func new_game():
	$Floor.position.x = 0
	$Player.position = PlayerInitialPoosition

func _process(delta):
	$Floor.position.x = $Player.position.x - 150
