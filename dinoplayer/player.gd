extends CharacterBody2D

const SPEED = 500
const JUMP_VELOCITY = -1000
const GRAVITY = 2500
var speedscale = 1

func _physics_process(delta):
	if GHUD.is_playing == true:
		if is_on_floor():
			if Input.is_action_pressed("ui_down"):
				$CollisionShape2D2.disabled = true
				$AnimatedSprite2D.play("crouch")
			else:
				$CollisionShape2D2.disabled = false
				$AnimatedSprite2D.play("run")
		else:
			$AnimatedSprite2D.play("jump")
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			$Audiojump.play()
			velocity.y = JUMP_VELOCITY
		velocity.x = SPEED + GHUD.score
		if GHUD.score > 150:
			speedscale = GHUD.score/150
		velocity.y += GRAVITY * delta
		$CollisionShape2D.disabled = !$CollisionShape2D2.disabled
		move_and_slide()
