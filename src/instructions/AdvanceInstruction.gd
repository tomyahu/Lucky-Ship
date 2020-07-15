extends "res://src/instructions/Instruction.gd"

var _distance = 0

# _ready: Vector2 -> SetDirectionInstruction
# param init_time: [num] time to start the instruction
# param duration: [num] the amount of time our instruction will take
# param distance: [num] the total distance to move
# after this instruction is executed
func init(param_arr):
	.init([param_arr[0], param_arr[1]])
	self._distance = param_arr[2]
	return self

# execute_instruction: num, Ship -> None
# param delta: [num] the amount of time that has passed since last frame
# param ship: [Ship] the ship to control
# causes the ship to advance
func execute_instruction(delta, ship):
	var distance_traveled_this_frame = delta / self._duration * self._distance
	ship.advance(distance_traveled_this_frame)
