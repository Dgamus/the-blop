extends Node
signal enemyresponse

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	$player_grav/attack2.body_entered.connect(_on_entered_body)

func _on_entered_body(body: Node2D):
	$Node2D/enemy1.damage()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_attack_2_body_entered(body: Node2D) -> void:
	print("john")


func _on_player_grav_attacking(attack: Area2D) -> void:
	pass
	







func _on_enemy_1_body_shape_entered(body_rid: RID, body: Node, body_shape_index: int, local_shape_index: int) -> void:
	print("go die")


func _on_gameover() -> void:
		get_tree().reload_current_scene()


func _on_enemy_1_win() -> void:
	$player_grav/Camera2D/win.show()
	$winTimer.wait_time = 20 
	$winTimer.autostart = true
	


func _on_win_timer_timeout() -> void:
	get_tree().reload_current_scene()
