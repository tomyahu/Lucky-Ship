extends Node2D

var Enemy = preload("res://scenes/enemy/Enemy.tscn")

var _enemy_type_array = []
var _enemy_amount_array = []

var _selected_enemy_index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_enemy_types_and_amount([Enemy], [2])
	self._selected_enemy_index = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Left Click"):
		self.add_selected_enemy()

# add_selected_enemy: None -> None
# adds the selected enemy at the current mouse position
func add_selected_enemy():
	if self._enemy_amount_array[_selected_enemy_index] > 0:
		self._enemy_amount_array[_selected_enemy_index] -= 1
		
		var mouse_position = get_viewport().get_mouse_position()
		var new_enemy = self._enemy_type_array[_selected_enemy_index].instance()
		new_enemy.set_position(mouse_position)
		
		$Enemies.add_child(new_enemy)
	
	

# setters
func set_enemy_types_and_amount(enemy_types, enemy_amounts):
	# TODO: if both arrays do not have the same length throw exception
	assert(len(enemy_types) == len(enemy_amounts))
	
	self._enemy_type_array = enemy_types
	self._enemy_amount_array = enemy_amounts
