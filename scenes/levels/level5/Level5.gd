extends "res://scenes/levels/Level.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	._ready()
	set_enemy_types_and_amount([Enemy, BounceEnemy1, BounceEnemy3], [1, 1, 1])

# level_completed: None -> None
# function run when a level is completed
func level_completed():
	get_tree().change_scene("res://scenes/levels/level6/Level6.tscn")

# get_ship_instriction_sequence: None -> InstructionSequence
# gets the ship's instruction sequence for the level
func _get_ship_instruction_sequence():
	var instruction_list = []
	instruction_list.append(AdvanceInstruction.new().init([0.1, 5, 4096]))
	instruction_list.append(SetSpeedInstruction.new().init([0.2, 1.2]))
	
	
	instruction_list.append(SetDirectionInstruction.new().init([0, 1, 0]))
	instruction_list.append(SetDirectionInstruction.new().init([0.7, 0, -1]))
	instruction_list.append(SetDirectionInstruction.new().init([1.32, -1, 0]))
	instruction_list.append(SetDirectionInstruction.new().init([1.4, 0, 1]))
	instruction_list.append(SetDirectionInstruction.new().init([1.95, 1, 0]))
	instruction_list.append(SetDirectionInstruction.new().init([2.05, 0, -1]))
	instruction_list.append(SetDirectionInstruction.new().init([2.1, 1, -1]))
	instruction_list.append(SetDirectionInstruction.new().init([2.15, -1, -1]))
	instruction_list.append(SetDirectionInstruction.new().init([2.2, 1, -1]))
	instruction_list.append(SetDirectionInstruction.new().init([2.25, -1, -1]))
	instruction_list.append(SetDirectionInstruction.new().init([2.3, 1, -1]))
	instruction_list.append(SetDirectionInstruction.new().init([2.35, -1, 0]))
	instruction_list.append(SetDirectionInstruction.new().init([2.55, 1, 1]))
	instruction_list.append(SetDirectionInstruction.new().init([2.65, 0, -1]))
	instruction_list.append(SetDirectionInstruction.new().init([3.05, -1, 0]))
	
	instruction_list.append(ShootInstruction.new().init([2.45]))
	
	var instruction_sequence = InstructionSequence.new().init([instruction_list])
	return instruction_sequence
