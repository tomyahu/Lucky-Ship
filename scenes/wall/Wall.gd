extends Node2D

# _on_object_entered: None -> None
# affects the object it hit
func _on_object_entered(area):
	self.affect_object(area.get_parent())

# affect_object: Object -> None
# destroys the object on contact
func affect_object(object):
	object.destroy()

# destroy: None -> None
# does nothing, a wall is indestructible
func destroy():
	pass
