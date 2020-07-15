extends Node2D

var InstructionSequence = preload("res://src/instruction_sequences/InstructionSequence.gd")
var Bullet = preload("res://scenes/bullet/Bullet.tscn")

# Signals
signal ship_destroyed

# Declare member variables here.
var _speed = 1
var direction = Vector2(0, -1)
var _instruction_sequence = InstructionSequence.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	self.adjust_angle()
	self._instruction_sequence.init([[]])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self._instruction_sequence.update(delta*self._speed, self)

# advance: num -> None
# Takes a distance value and moves the ship in the direction it is facing by
# distance
func advance(distance):
	var move = self.direction*distance
	self.position += move

# shoot: None -> None
# shoots a bullet from the front of the ship
func shoot():
	var new_bullet = Bullet.instance()
	new_bullet.set_pos($BulletSpawnPoint.get_global_position())
	new_bullet.set_direction(self.direction)
	$Bullets.add_child(new_bullet)
	$ShootPlayer.play()

# adjust_angle: None -> None
# adjusts the angle of the ship
func adjust_angle():
	var angle = atan2(self.direction.y, self.direction.x)
	self.rotation = angle
	self.rotate(PI/2)

# destroy: None -> None
# function called when the player is destroyed
func destroy():
	emit_signal("ship_destroyed")

# setters
func set_speed(new_speed):
	self._speed = new_speed

func set_position(new_pos):
	self.position = new_pos

func set_direction(x, y):
	self.direction = Vector2(x, y).normalized()
	self.adjust_angle()

func set_direction_vec2(new_dir):
	self.direction = new_dir
	self.adjust_angle()

func set_instruction_sequence(new_instruction_sequence):
	self._instruction_sequence = new_instruction_sequence
	self._instruction_sequence.reset()

# getters
func get_position():
	return self.position

func get_direction():
	return self.direction
