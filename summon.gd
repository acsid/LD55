extends Node2D

var fish = preload("res://fish.tscn")

var expire = 10
var speed = 20


# Called when the node enters the scene tree for the first time.
func _ready():
	$Despawn.start(expire)
	$Fish.start(speed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_fish_timeout():
	var fishInst = fish.instantiate()
	fishInst.global_position = global_position
	get_tree().get_current_scene().add_child(fishInst)


func _on_despawn_timeout():
	queue_free()
