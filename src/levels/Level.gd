extends Node

var InstructionSequence = preload("res://src/instruction_sequences/InstructionSequence.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# get_ship_instriction_sequence: None -> InstructionSequence
# gets the ship's instruction sequence for the level
func get_ship_instruction_sequence():
	var instruction_sequence = InstructionSequence.new().init([])
	return instruction_sequence
