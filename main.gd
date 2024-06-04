extends Node2D
@export var mob_scene: PackedScene

var screen_size : Vector2i

var PlayerInitialPoosition

func _ready():
	screen_size = get_window().size
	PlayerInitialPoosition = $Player.position
	GHUD.start_game.connect(new_game)
	
func game_over():
	GHUD.update_high_score_label()
	$MOBTimer.stop()
	GHUD.mob_counter = 0
	
func new_game():
	print('empieza')
	$Floor.position.x = 0
	$Player.position = PlayerInitialPoosition
	$MOBTimer.start()

func _process(delta):
	$Floor.position.x = $Player.position.x - 150

func _on_mob_timer_timeout():
	print(GHUD.mob_counter)
	if GHUD.mob_counter < 2:
		var mob = mob_scene.instantiate()
		mob.position.x = $Player.position.x + 1500
		mob.position.y = 550
		add_child(mob)
		mob.hit.connect(game_over)
		$MOBTimer.wait_time = 2
