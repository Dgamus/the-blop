extends RigidBody2D
var pos
var check
var health = 2
signal win
@export var speed: float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pos = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Path2D/PathFollow2D.progress_ratio >= 0.9 or $Path2D/PathFollow2D.progress_ratio <= 0.1:
		speed = speed * -1
	
	if speed > 0:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
	$Path2D/PathFollow2D.progress_ratio += speed*delta
	$AnimatedSprite2D.play()

	position.x = $Path2D/PathFollow2D.progress + pos.x


func _on_player_grav_attacking(attack: Area2D) -> void:
	var a: Area2D = attack.duplicate();
		
		#print("water")
func damage():
	health -= 1
	$Path2D/PathFollow2D.progress_ratio - 2*speed
	if health == 0:
		hide()
		$CollisionShape2D.set_deferred("disable", true)
		win.emit()
	
