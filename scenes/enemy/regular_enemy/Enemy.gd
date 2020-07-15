extends Node2D


# Declare member variables here. Examples:


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# destroy: None -> None
# destroys the enemy
func destroy():
	Global.get_node("DestructionPlayer").play()
	self.visible = false
	self.queue_free()

# setters
func set_position(new_position):
	position = new_position

# _on_object_entered: None -> None
# destroys the object when an object hits it
func _on_object_entered(area):
	self.affect_object(area.get_parent())
	self.destroy()

# affect_object: Object -> None
# destroys the object on contact
func affect_object(object):
	object.destroy()
