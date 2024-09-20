extends CharacterBody2D





@export var speed = 200
const GRAVITY = 200.0
const jump_speed = 200
func _ready():
	$AnimatedSprite2D.animation = "walk"

func _physics_process(delta):
#gravity

	if not is_on_floor():

		velocity.y += GRAVITY * delta

	

#Jump

	if Input.is_action_just_pressed("jump") and is_on_floor():

		velocity.y = jump_speed

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()




	#Input Direction

	var direction = Input.get_axis("left","right")

	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	

	move_and_slide()
