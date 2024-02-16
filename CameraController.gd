extends Camera2D
onready var player = get_node("/root/Mainscene/Player")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _process(_delta):
	position.x = player.position.x

# Called when the node enters the scene tree for the first time.
