extends "res://src/instructions/Instruction.gd"

var _x = 1
var _y = 0

# _ready: Vector2 -> SetDirectionInstruction
# param init_time: [num] time to start the instruction
# param direction_vector: [num] the direction the ship will be facing in x
# param direction_vector: [num] the direction the ship will be facing in y
# after this instruction is executed
func init(param_arr):
	.init([param_arr[0], 0])
	self._x = param_arr[1]
	self._y = param_arr[2]
	return self

# execute_instruction: num, Ship -> None
# param delta: [num] the amount of time that has passed since last frame
# param ship: [Ship] the ship to control
# causes the ship to change direction
func execute_instruction(delta, ship):
	ship.set_direction(self._x, self._y)
