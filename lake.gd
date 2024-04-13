extends Node2D

var lakesize = 32

var lake1 = preload("res://map/chunk.tscn")
var lake2 = preload("res://map/chunkdark.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	print("Generating Lake...")
	for c in lakesize:
		var rnd = randi_range(0,1)
		var chunkT = lake1
		if rnd == 0:
			chunkT = lake1
		if rnd == 1:
			chunkT = lake2
		
		var chunk = chunkT.instantiate()
		chunk.position.x += lakesize * 32 * c
		add_child.call_deferred(chunk)
	print("Done!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_buymana_body_entered(body):
	pass # Replace with function body.


func _on_dock_body_entered(body):
	pass # Replace with function body.


func _on_dock_body_exited(body):
	pass # Replace with function body.


func _on_buymana_body_exited(body):
	pass # Replace with function body.
