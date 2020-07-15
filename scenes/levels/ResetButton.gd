extends "res://scenes/levels/PlayButton.gd"

# pressed_action: None -> None
# resets the level
func pressed_action():
	var level = self.get_parent().get_parent()
	level.reset()
