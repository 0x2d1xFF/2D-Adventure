extends Area2D


func _ready():
	pass 




func _on_Death_Zone_body_entered(body):
	if body.name == "Player":
		print("Death zone entered!")
		body.die()
