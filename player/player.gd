extends Area2D
@export var speed = 200


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("Walk_Right"):
		velocity.x += 1
	if Input.is_action_pressed("Walk_Left"):
		velocity.x -= 1
	#if Input.is_action_pressed("move_down"):
		#velocity.y += 1
	if Input.is_action_pressed("Jump"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.stop()
	position += velocity * delta

	
