extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# get_global_position: None -> Vector2
# gets the global position of the bullet spawn point point
func get_global_position():
	return self.global_transform.origin
