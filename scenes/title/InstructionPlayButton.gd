extends "res://scenes/title/TitlePlayButton.gd"


# button_released: None -> None
# function that runs when the button is released
func button_released():
	$AnimatedSprite.play("default")
	Global.get_node("Player").play()
	get_tree().change_scene("res://scenes/levels/level1/Level1.tscn")
