extends KinematicBody2D

var score: int = 0
var coins_collected: int = 0
var total_coins: int = 12

export var speed: int = 200
export var jumpForce: int = 600
export var gravity: int = 800
var velocity: Vector2 = Vector2()
var grounded: bool = false
onready var sprite = $Sprite
onready var ui = get_node("/root/Mainscene/CanvasLayer/UI")

onready var _animation_player = $AnimationPlayer

func _process(_delta):
	if Input.is_action_pressed("move_right"):
		_animation_player.play("Animation")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("move_left"):
		_animation_player.play("Animation")
		$Sprite.flip_h = true
	else:
		_animation_player.stop()

func _physics_process(delta):
	velocity.x = 0
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	velocity = move_and_slide(velocity, Vector2.UP)

	velocity.y += gravity * delta
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y -= jumpForce

	if velocity.x < 0:
		sprite.flip_h = true
	if velocity.x > 0:
		sprite.flip_h = false

	# Check if player falls off the map
	if position.y > 1000:
		die()

func die():
	get_tree().reload_current_scene()

func collect_coin(value):
	score += value
	ui.set_score_text(score)

	coins_collected += 1
	if coins_collected >= total_coins:
		get_tree().change_scene("WinSC.tscn")
