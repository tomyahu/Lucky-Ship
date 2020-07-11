extends Node2D


export var speed = 400
var _direction = Vector2(0, 0)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += self._direction * self.speed * delta
	
	# If bullet not on screen delete
	if not $VisibilityNotifier2D.is_on_screen():
		self.free()

# adjust_angle: None -> None
# adjusts the angle the bullet is drawn
func adjust_angle():
	var angle = atan2(self._direction.y, self._direction.x)
	self.rotation = angle
	self.rotate(PI/2)

# setters
func set_pos(pos):
	self.position = pos

func set_direction(new_direction):
	self._direction = new_direction
	self.adjust_angle()
