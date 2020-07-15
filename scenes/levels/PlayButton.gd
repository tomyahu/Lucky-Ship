extends Node2D


# Declare member variables here. Examples:
var _mouse_inside = false


# Called when the node enters the scene tree for the first time.
func _ready():
	self._mouse_inside = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self._mouse_inside:
		if Input.is_action_just_pressed("Left Click"):
			self.button_pressed()
			
		if Input.is_action_just_released("Left Click"):
			self.button_released()

# button_pressed: None -> None
# function that runs when the button is pressed
func button_pressed():
	self.pressed_action()
	Global.get_node("ButtonPlayer").play()
	$AnimatedSprite.play("pressed")

# button_released: None -> None
# function that runs when the button is released
func button_released():
	$AnimatedSprite.play("default")

# pressed_action: None -> None
# plays the level
func pressed_action():
	var level = self.get_parent().get_parent()
	level.play_level()

func _on_Area2D_mouse_entered():
	self._mouse_inside = true

func _on_Area2D_mouse_exited():
	self._mouse_inside = false
	if Input.is_action_pressed("Left Click"):
		self.button_released()
