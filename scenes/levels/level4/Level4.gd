extends "res://scenes/levels/Level.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	._ready()
	set_enemy_types_and_amount([Enemy, BounceEnemy1], [1, 2])

# level_completed: None -> None
# function run when a level is completed
func level_completed():
	get_tree().change_scene("res://scenes/levels/level5/Level5.tscn")

# get_ship_instriction_sequence: None -> InstructionSequence
# gets the ship's instruction sequence for the level
func _get_ship_instruction_sequence():
	var instruction_list = []
	instruction_list.append(AdvanceInstruction.new().init([0, 5, 4096]))
	
	var aux = 0.5
	for i in range(18):
		instruction_list.append(SetDirectionInstruction.new().init([aux, 1, 0]))
		instruction_list.append(SetDirectionInstruction.new().init([aux+0.05, 0, 1]))
		instruction_list.append(SetDirectionInstruction.new().init([aux+0.1, -1, 0]))
		instruction_list.append(SetDirectionInstruction.new().init([aux+0.15, 0, -1]))
		aux += 0.2
	
	instruction_list.append(SetDirectionInstruction.new().init([1.52, -1, 1]))
	instruction_list.append(SetDirectionInstruction.new().init([2.22, 1, -1]))
	instruction_list.append(SetDirectionInstruction.new().init([4.12, 1, -1]))
	instruction_list.append(SetDirectionInstruction.new().init([4.2, 1, 1]))
	instruction_list.append(SetDirectionInstruction.new().init([4.26, 1, -1]))
	
	instruction_list.append(ShootInstruction.new().init([0.77]))
	instruction_list.append(ShootInstruction.new().init([3.12]))
	
	var instruction_sequence = InstructionSequence.new().init([instruction_list])
	return instruction_sequence
