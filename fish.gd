extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity = Vector2(randf_range(-500,500),-500)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name ==  "boat":
		body.get_fish(1)
		queue_free()
	pass # Replace with function body.


func _on_despawn_timeout():
	queue_free()
