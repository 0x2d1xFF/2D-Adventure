extends Area2D
export var value = 1

func _process(delta):
	rotation_degrees += 90 * delta

func _on_Coins_body_entered(body):
	if body.name == "Player":
		body.collect_coin(value)
		queue_free()

