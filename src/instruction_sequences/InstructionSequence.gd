extends Node

var _current_time
var _instruction_list

var _current_instructions
var _pending_instructions

# resets the internal variables of the sequence and sets the instruction list
func init(param_arr):
	self._instruction_list = param_arr[0]
	self.reset()
	return self

# update: num, Ship -> None
# executes the instructions to run
func update(delta, ship):
	self._current_time += delta
	
	# Update current instructions
	for instruction in self._current_instructions:
		instruction.update(delta, ship)
	
	# Update pending instructions to be passed to current instructions
	for instruction in self._pending_instructions:
		if self._current_time > instruction.get_init_time():
			instruction.update(delta - (self._current_time - instruction.get_init_time()), ship)
			self._pending_instructions.erase(instruction)
			self._current_instructions.append(instruction)
	
	# Delete unnecessary instructions from current instructions list
	for instruction in self._current_instructions:
		if instruction.has_ended():
			self._current_instructions.erase(instruction)


# reset: None -> None
# resets the internal time, and internal instruction lists
func reset():
	self._current_time = 0
	self._current_instructions = []
	self._pending_instructions = []
	
	for instruction in self._instruction_list:
		instruction.reset()
		self._pending_instructions.append(instruction)
