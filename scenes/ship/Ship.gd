extends Node2D

var InstructionSequence = preload("res://src/instruction_sequences/InstructionSequence.gd")
var Bullet = preload("res://scenes/bullet/Bullet.tscn")

# TODO: Delete this line
var LevelDebug = preload("res://src/levels/LevelDebug.gd")


# Declare member variables here.
export var speed = 200
var direction = Vector2(1, 0)
var _instruction_sequence = InstructionSequence.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	self.adjust_angle()
	self._instruction_sequence.init([[]])
	
	# TODO: Delete this line
	self.set_instruction_sequence(LevelDebug.new().get_ship_instruction_sequence())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self._instruction_sequence.update(delta, self)

# advance: num -> None
# Takes the time elapsed since last frame and moves the ship in the direction
# it is facing given its speed
func advance(delta):
	var move = self.direction*self.get_speed()*delta
	self.position += move

# shoot: None -> None
# shoots a bullet from the front of the ship
func shoot():
	var new_bullet = Bullet.instance()
	new_bullet.set_pos($BulletSpawnPoint.get_global_position())
	new_bullet.set_direction(self.direction)
	$Bullets.add_child(new_bullet)

# adjust_angle: None -> None
# adjusts the angle of the ship
func adjust_angle():
	var angle = atan2(self.direction.y, self.direction.x)
	self.rotation = angle
	self.rotate(PI/2)

# setters
func set_speed(new_speed):
	self.speed = new_speed

func set_direction(x, y):
	self.direction = Vector2(x, y).normalized()
	self.adjust_angle()

func set_instruction_sequence(new_instruction_sequence):
	self._instruction_sequence = new_instruction_sequence
	self._instruction_sequence.reset()

# getters
func get_speed():
	return self.speed
