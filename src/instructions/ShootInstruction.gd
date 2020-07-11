extends "res://src/instructions/Instruction.gd"

# _ready: Vector2 -> SetDirectionInstruction
# param init_time: [num] time to start the instruction
# after this instruction is executed
func init(param_arr):
	.init([param_arr[0], 0])
	return self

# execute_instruction: num, Ship -> None
# param delta: [num] the amount of time that has passed since last frame
# param ship: [Ship] the ship to control
# causes the ship to shoot
func execute_instruction(delta, ship):
	ship.shoot()
