extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var _destroyed
var _just_destroyed


# Called when the node enters the scene tree for the first time.
func _ready():
	_just_destroyed = false
	_destroyed = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self._destroyed:
		self.free()

	if self._just_destroyed:
		self.destroy()

# destroy: None -> None
# destroys the enemy
func destroy():
	self.visible = false

# _on_bullet_entered: None -> None
# deletes the object when a bullet hits it
func _on_bullet_entered(area):
	self.affect_bullet(area.get_parent())
	
	self._just_destroyed = true
	$Area2D.disconnect("area_entered", self, "_on_bullet_entered")

# affect_bullet: Bullet -> None
# destroys the bullet on contact
func affect_bullet(bullet):
	bullet.free()

# setters
func set_position(new_position):
	position = new_position
