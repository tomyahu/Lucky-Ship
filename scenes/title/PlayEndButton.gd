extends "res://scenes/title/TitlePlayButton.gd"


# button_released: None -> None
# function that runs when the button is released
func button_released():
	$AnimatedSprite.play("default")
	get_tree().quit()
