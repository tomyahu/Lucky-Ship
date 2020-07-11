extends "res://src/instructions/Instruction.gd"

func execute_instruction(delta, ship):
	"""
	causes the ship to advance
	param delta: [num] the amount of time that has passed since last frame
	param ship: [Ship] the ship to control
	"""
	ship.advance(delta)
