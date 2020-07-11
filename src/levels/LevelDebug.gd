extends "res://src/levels/Level.gd"

var AdvanceInstruction = preload("res://src/instructions/AdvanceInstruction.gd")
var SetDirectionInstruction = preload("res://src/instructions/SetDirectionInstruction.gd")
var ShootInstruction = preload("res://src/instructions/ShootInstruction.gd")

# get_ship_instriction_sequence: None -> InstructionSequence
# gets the ship's instruction sequence for the level
func get_ship_instruction_sequence():
	var instruction_list = []
	instruction_list.append(AdvanceInstruction.new().init([0,5]))
	instruction_list.append(SetDirectionInstruction.new().init([0, 0, -1]))
	instruction_list.append(SetDirectionInstruction.new().init([1, 1, 0]))
	instruction_list.append(SetDirectionInstruction.new().init([3, 0, -1]))
	instruction_list.append(ShootInstruction.new().init([2]))
	
	var instruction_sequence = InstructionSequence.new().init([instruction_list])
	return instruction_sequence
