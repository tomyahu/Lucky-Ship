extends "res://scenes/enemy/regular_enemy/Enemy.gd"

var Bullet = preload("res://scenes/bullet/Bullet.gd")

export var reflect_vector = Vector2(1, -1)



func ready():
	self.reflect_vector = self.reflect_vector.normalized()

# affect_object: Object -> None
# changes direction of bullets and destroys other objects
func affect_object(object):
	if object is Bullet:
		if sign(object.get_direction().dot(reflect_vector)) < 0:
			var bullet_direction = object.get_direction()
			var rotated_reflect = self.reflect_vector.rotated(PI/2)
			
			var alpha = (bullet_direction.y*reflect_vector.x - bullet_direction.x*reflect_vector.y) / (rotated_reflect.y*reflect_vector.x - rotated_reflect.x*reflect_vector.y)
			var beta = (bullet_direction.x - alpha*rotated_reflect.x) / reflect_vector.x
			
			object.set_direction(alpha*rotated_reflect - beta*reflect_vector)
		else:
			object.destroy()
	else:
		object.destroy()
