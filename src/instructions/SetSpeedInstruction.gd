extends "res://src/instructions/Instruction.gd"

var _speed = 1

# _ready: Vector2 -> SetDirectionInstruction
# param init_time: [num] time to start the instruction
# param speed: [num] the speed to set to the ship
# after this instruction is executed
func init(param_arr):
	.init([param_arr[0], 0])
	self._speed = param_arr[1]
	return self

# execute_instruction: num, Ship -> None
# param delta: [num] the amount of time that has passed since last frame
# param ship: [Ship] the ship to control
# changes the ship's speed
func execute_instruction(delta, ship):
	ship.set_speed(self._speed)
