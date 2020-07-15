extends Node2D

func _on_object_entered(area):
	var level = self.get_tree().root.get_child(1)
	level.check_for_level_completed()
