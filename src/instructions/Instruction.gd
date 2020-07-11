extends Node

# An instruction that commands the ship in an instruction sequence

var _init_time
var _duration
var _current_time

# init: num -> Instruction
# param init_time: [num] time to start the instruction
# param duration: [num] the amount of time our instruction will take
# initializes variables
func init(param_arr):
	self._init_time = param_arr[0]
	self._duration = param_arr[1]
	self._current_time = 0
	return self

# update: num, Ship -> None
# param delta: [num] the amount of time that has passed since last frame
# param ship: [Ship] the ship to control
# updates the internal timers and gives instructions to the ship
func update(delta, ship):
	delta = min(delta, self._duration - self._current_time)
	self.execute_instruction(delta, ship)
	self._current_time += delta

# execute_instruction: num, Ship -> None
# param delta: [num] the amount of time that has passed since last frame
# param ship: [Ship] the ship to control
# executes this class instruction on the ship to control
func execute_instruction(delta, ship):
	pass

# reset: None -> None
# resets the internal timer of the instruction
func reset():
	self._current_time = 0

# has_ended: None -> bool
# checks if the instruction has ended
func has_ended():
	return self._duration <= self._current_time

# getters
func get_init_time():
	return self._init_time
