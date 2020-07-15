extends "res://scenes/levels/PlayButton.gd"

# pressed_action: None -> None
# resets the level
func pressed_action():
	pass

# button_released: None -> None
# function that runs when the button is released
func button_released():
	$AnimatedSprite.play("default")
	get_tree().change_scene("res://scenes/title/InstructionsScene.tscn")
