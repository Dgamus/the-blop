extends CharacterBody2D

var dead: bool = false
var canAttack: bool = true
var health = 2
signal gameover
var startpos = position
@export var speed = 200


const JUMP_speed = -400
func _ready():
	$AnimatedSprite2D.animation = "walk"
	




func _physics_process(delta):
#gravity
	if dead:
		return
	if not is_on_floor():

		velocity += get_gravity() * delta
		$AnimatedSprite2D.stop()


	if Input.is_action_just_pressed("Jump") and is_on_floor():
		$AnimatedSprite2D.play("jump")
		velocity.y = JUMP_speed
		await get_tree().create_timer(0.1).timeout
		$AnimatedSprite2D.animation ="walk"

	if Input.is_action_just_pressed("attack") and canAttack == true:
		canAttack = false
		$attack.show()
		$attack.play()
		$attack2.monitoring = true

		$frame.wait_time = 0.2
		$cooldown.wait_time = 0.6
		
	var direction = Input.get_axis("Walk_Left","Walk_Right")

	if direction:

		velocity.x = direction * speed
		
		$AnimatedSprite2D.flip_h = velocity.x < 0
		$AnimatedSprite2D.play("walk")
		$attack.flip_h = velocity.x < 0
		if $attack.flip_h == true:
			$attack.position.x = -46.51
			$attack2/CollisionShape2D.position.x = -46
		else:
			$attack.position.x = 0
			$attack2/CollisionShape2D.position.x = 46
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		$AnimatedSprite2D.stop()
		
	

	move_and_slide()






func _on_area_2d_body_entered(body: Node2D) -> void:
	gameover.emit()

func _on_cooldown_timeout() -> void:
	canAttack = true


func _on_attack_2_body_entered(body: Node2D):
	print (body)


func _on_frame_timeout() -> void:
	$attack.hide()
	$attack.stop()
	$attack2.monitoring = false
	


func _on_hitbox_body_entered(body: Node2D) -> void:
	health -= 1
	if $AnimatedSprite2D.flip_h == false:
		velocity = Vector2(-400,100)
	else:
		velocity = Vector2(400,100)
	if health == 0:
		gameover.emit()
	print (health)
