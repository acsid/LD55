extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var mana = 10
var maxmana= 10
var manabottle = 12
var fish = 0

var cooldown_time = 2
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var cast = 0

var castui = preload("res://cast.tscn")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if get_node_or_null("Cast") == null:
		move_and_slide()

func _process(delta):
	if velocity.x != 0:
		$AnimatedSprite2D.play("moving")
	else: 
		$AnimatedSprite2D.play("default")
	if get_node_or_null("Cast") == null:
		if Input.is_action_just_pressed("drink"):
			drinkMana()
		if Input.is_action_just_pressed("summon1"):
			if mana >= 4:
				mana -= 4
				cast = randi_range(1,10)
				var uiInst = castui.instantiate()
				
				add_child(uiInst)

func drinkMana():
	$cooldown.start(1)
	$Mana.visible = true
	if mana != maxmana:
		mana += 25
	if mana > maxmana:
		mana = maxmana
		
func get_fish(fishvalue):
	fish += fishvalue
	print(fish)


func _on_cooldown_timeout():
	$Mana.visible = false
