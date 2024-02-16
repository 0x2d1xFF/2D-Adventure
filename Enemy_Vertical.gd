extends Area2D
export var speed: int = 100
export var moveDist: int = 100

onready var startY: float = position.y
onready var targetY: float = position.y + moveDist
func _ready():
	pass 

func _process(delta):
	rotation_degrees += 720 * delta
	
func move_to(current, to, step):
	var new = current
	
	if new < to:
		new += step
		if new > to:
			new = to
	else:
		new -= step
		if new < to:
			new = to
	return new
	
func _physics_process(delta):
	position.y = move_to(position.y, targetY, speed * delta)
	 
	if position.y == targetY:
		if targetY == startY:
			targetY = position.y + moveDist
		else:
			targetY = startY
func _on_Enemy_body_entered(body):
	if body.name == "Player":
		body.die()
