extends "res://scenes/levels/Level.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	._ready()
	set_enemy_types_and_amount([Enemy, BounceEnemy1, BounceEnemy2, BounceEnemy3, BounceEnemy4], [1, 1, 2, 2, 2])

# level_completed: None -> None
# function run when a level is completed
func level_completed():
	get_tree().change_scene("res://scenes/title/End.tscn")

# get_ship_instriction_sequence: None -> InstructionSequence
# gets the ship's instruction sequence for the level
func _get_ship_instruction_sequence():
	var instruction_list = []
	
	for i in range(150):
		instruction_list.append(SetDirectionInstruction.new().init([i/100.0, randf()*2-1, randf()*2-1]))
	
	instruction_list.append(SetDirectionInstruction.new().init([1.55, 1, 0]))
	instruction_list.append(ShootInstruction.new().init([1.55]))
	
	instruction_list.append(SetDirectionInstruction.new().init([1.6, 0, -1]))
	instruction_list.append(AdvanceInstruction.new().init([1.7, 1, 576]))
	
	for i in range(370):
		instruction_list.append(SetDirectionInstruction.new().init([2.7 + i/100.0, randf()*2-1, randf()*2-1]))
	instruction_list.append(SetDirectionInstruction.new().init([6.5, 1, 0]))
	instruction_list.append(AdvanceInstruction.new().init([6.5, 1, 576]))
	
	var instruction_sequence = InstructionSequence.new().init([instruction_list])
	return instruction_sequence
