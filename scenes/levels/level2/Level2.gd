extends "res://scenes/levels/Level.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	._ready()
	set_enemy_types_and_amount([Enemy], [2])

# level_completed: None -> None
# function run when a level is completed
func level_completed():
	get_tree().change_scene("res://scenes/levels/level3/Level3.tscn")

# get_ship_instriction_sequence: None -> InstructionSequence
# gets the ship's instruction sequence for the level
func _get_ship_instruction_sequence():
	var instruction_list = []
	instruction_list.append(AdvanceInstruction.new().init([0, 5, 4096]))
	instruction_list.append(ShootInstruction.new().init([0.1]))
	instruction_list.append(ShootInstruction.new().init([1.35]))
	instruction_list.append(SetDirectionInstruction.new().init([0, 1, 0]))
	instruction_list.append(SetDirectionInstruction.new().init([0.4, -1, -1]))
	instruction_list.append(SetDirectionInstruction.new().init([0.8, 0, 1]))
	instruction_list.append(SetDirectionInstruction.new().init([1.0, 1, 1]))
	instruction_list.append(SetDirectionInstruction.new().init([1.1, 1, -1]))
	instruction_list.append(SetDirectionInstruction.new().init([1.3, -1, 0]))
	instruction_list.append(SetDirectionInstruction.new().init([1.4, 0, -1]))
	instruction_list.append(SetDirectionInstruction.new().init([1.7, 1, 0]))
	instruction_list.append(SetDirectionInstruction.new().init([1.9, 1, -1]))
	
	var instruction_sequence = InstructionSequence.new().init([instruction_list])
	return instruction_sequence
