extends "res://src/instructions/Instruction.gd"

# execute_instruction: num, Ship -> None
# param delta: [num] the amount of time that has passed since last frame
# param ship: [Ship] the ship to control
# causes the ship to advance
func execute_instruction(delta, ship):
	ship.advance(delta)
