extends Node2D

var Enemy = preload("res://scenes/enemy/regular_enemy/Enemy.tscn")
var BounceEnemy1 = preload("res://scenes/enemy/bounce_enemy/BounceEnemy.tscn")
var BounceEnemy2 = preload("res://scenes/enemy/bounce_enemy/BounceEnemy2.tscn")
var BounceEnemy3 = preload("res://scenes/enemy/bounce_enemy/BounceEnemy3.tscn")
var BounceEnemy4 = preload("res://scenes/enemy/bounce_enemy/BounceEnemy4.tscn")
var InstructionSequence = preload("res://src/instruction_sequences/InstructionSequence.gd")

var AdvanceInstruction = preload("res://src/instructions/AdvanceInstruction.gd")
var SetDirectionInstruction = preload("res://src/instructions/SetDirectionInstruction.gd")
var ShootInstruction = preload("res://src/instructions/ShootInstruction.gd")
var SetSpeedInstruction = preload("res://src/instructions/SetSpeedInstruction.gd")


var _enemy_type_array = []
var _enemy_amount_array = []
var _initial_enemy_amount_array = []

var _ship_initial_position = Vector2(0,0)
var _ship_initial_direction = Vector2(0,0)

var _selected_enemy_index = 0
var _ship_instruction_sequence = InstructionSequence.new()

var _in_play_area = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_enemy_types_and_amount([Enemy], [2])
	self._selected_enemy_index = 0
	
	self._ship_initial_position = $Playground/Ship.get_position()
	self._ship_initial_direction = $Playground/Ship.get_direction()
	
	self._ship_instruction_sequence = self._get_ship_instruction_sequence()
	
	self._in_play_area = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self._in_play_area:
		if Input.is_action_just_pressed("Left Click"):
			self.add_selected_enemy()
	
	if Input.is_action_just_pressed("ui_left"):
		self.select_left_resource()
	
	if Input.is_action_just_pressed("ui_right"):
		self.select_right_resource()
	
	if Input.is_action_just_pressed("ui_1"):
		self.select_resource_with_index(0)
	
	if Input.is_action_just_pressed("ui_2"):
		self.select_resource_with_index(1)
	
	if Input.is_action_just_pressed("ui_3"):
		self.select_resource_with_index(2)
	
	if Input.is_action_just_pressed("ui_4"):
		self.select_resource_with_index(3)
	
	if Input.is_action_just_pressed("ui_5"):
		self.select_resource_with_index(4)

# select_resource_with_index: num -> None
# selects a resource form the options
func select_resource_with_index(index):
	if index >= 0 and index < len(_enemy_amount_array):
		var slots = $Overlay/AvailableEnemies.get_children()
		var prev_slot = slots[_selected_enemy_index]
		prev_slot.get_node("Selected").visible = false
		
		self._selected_enemy_index = index
		var current_slot = slots[_selected_enemy_index]
		current_slot.get_node("Selected").visible = true

# select_left_resource: None -> None
# selects the resource to the left of the currently selected resource
func select_left_resource():
	var new_index = (self._selected_enemy_index - 1 + len(_enemy_amount_array)) % len(_enemy_amount_array)
	self.select_resource_with_index(new_index)

# select_right_resource: None -> None
# selects the resource to the left of the currently selected resource
func select_right_resource():
	var new_index = (self._selected_enemy_index + 1) % len(_enemy_amount_array)
	self.select_resource_with_index(new_index)

# add_selected_enemy: None -> None
# adds the selected enemy at the current mouse position
func add_selected_enemy():
	if self._enemy_amount_array[_selected_enemy_index] > 0:
		self._enemy_amount_array[_selected_enemy_index] -= 1
		
		var mouse_position = get_viewport().get_mouse_position()
		var new_enemy = self._enemy_type_array[_selected_enemy_index].instance()
		new_enemy.set_position(mouse_position)
		
		$Playground/Enemies.add_child(new_enemy)
		
		self.update_resources()

# play_level: None -> None
# starts playing the level
func play_level():
	self.reset()
	self._ship_instruction_sequence.reset()
	$Playground/Ship.set_instruction_sequence(self._ship_instruction_sequence)

# level_failed: None -> None
# function called when the level is failed, resets the level
func level_failed():
	self.reset()

# check_for_level_completed: None -> None
# checks if the level was completed
func check_for_level_completed():
	var no_enemies_on_level = len($Playground/Enemies.get_children()) == 0
	var no_more_resources = true
	for amount in self._enemy_amount_array:
		no_more_resources = no_more_resources and (amount == 0)
	
	if no_enemies_on_level and no_more_resources:
		Global.get_node("VictoryPlayer").play()
		self.level_completed()
	else:
		Global.get_node("FailPlayer").play()
		self.reset()

# level_completed: None -> None
# function run when a level is completed
func level_completed():
	print("level completed")

# reset: None -> None
# resets the player resources, the ship attributes and cleans the enemies and
# bullets form the screen
func reset():
	# Clean enemies
	for enemy in $Playground/Enemies.get_children():
		enemy.queue_free()
	
	# TODO: Clean bullets
	for bullet in $Playground/Ship/Bullets.get_children():
		bullet.queue_free()
	
	# reset ship position and direction
	$Playground/Ship.set_instruction_sequence(InstructionSequence.new().init([[]]))
	$Playground/Ship.set_position(self._ship_initial_position)
	$Playground/Ship.set_direction_vec2(self._ship_initial_direction)
	
	# reset resources
	self._enemy_amount_array = []
	for amount in self._initial_enemy_amount_array:
		self._enemy_amount_array.append(amount)
	self.update_resources()

# get_ship_instriction_sequence: None -> InstructionSequence
# gets the ship's instruction sequence for the level
func _get_ship_instruction_sequence():
	var instruction_list = []
	instruction_list.append(AdvanceInstruction.new().init([0, 5, 1000]))
	instruction_list.append(SetDirectionInstruction.new().init([0, 0, -1]))
	instruction_list.append(SetDirectionInstruction.new().init([1, 1, 0]))
	instruction_list.append(SetDirectionInstruction.new().init([3, 0, -1]))
	instruction_list.append(ShootInstruction.new().init([2]))
	instruction_list.append(ShootInstruction.new().init([2.5]))
	
	var instruction_sequence = InstructionSequence.new().init([instruction_list])
	return instruction_sequence

# _on_PlayArea_mouse_entered: None -> None
# Run every time the mouse enters the play area
func _on_PlayArea_mouse_entered():
	self._in_play_area = true

# _on_PlayArea_mouse_exited: None -> None
# Run every time the mouse exits the play area
func _on_PlayArea_mouse_exited():
	self._in_play_area = false

# update_resources: None -> None
# updates the current resources
func update_resources():
	var slots = $Overlay/AvailableEnemies.get_children()
	
	for i in range(min(5, len(_enemy_amount_array))):
		var slot = slots[i]
		slot.get_node("Label").text = str(self._enemy_amount_array[i])
		slot.visible = true

# setters
func set_enemy_types_and_amount(enemy_types, enemy_amounts):
	# if both arrays do not have the same length throw exception
	assert(len(enemy_types) == len(enemy_amounts))
	
	self._enemy_type_array = enemy_types
	self._initial_enemy_amount_array = enemy_amounts
	self._enemy_amount_array = []
	for amount in self._initial_enemy_amount_array:
		self._enemy_amount_array.append(amount)
	
	self.update_resources()

# _on_Ship_ship_destroyed: None -> None
# set level failed
func _on_Ship_ship_destroyed():
	self.level_failed()
