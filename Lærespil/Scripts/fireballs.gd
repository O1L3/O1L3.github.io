extends Area2D
var rng = RandomNumberGenerator.new()
var time = 0
var damage_taken : bool = false

func _process(delta):
	var anim = $AnimatedSprite
	anim.play("default")
	fire_move()
	if position.y > 700:
		position.y = -25
		position.x =  rng.randf_range(500.0, 860.0)


func _on_fireballs2_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Scenes/lose.tscn")

func fire_move():
	if damage_taken == false:
			if time <= 10 or time >= 20 and time <= 30 or time >=40 and time <= 50 or time >=60 and time <= 70 or time >=80and time <=90 or time >= 100:
				move_local_y(5)
			else:
				move_local_y(1)
	else:
		move_local_y(5)

func _on_Timer_timeout():
	time = time +1

func _on_Mainscene_my_signal():
	damage_taken = true
	yield(get_tree().create_timer(.9), "timeout")
	yield(get_tree().create_timer(.9), "timeout")
	yield(get_tree().create_timer(.9), "timeout")
	yield(get_tree().create_timer(.9), "timeout")
	yield(get_tree().create_timer(.9), "timeout")
	yield(get_tree().create_timer(.9), "timeout")
	yield(get_tree().create_timer(.9), "timeout")
	yield(get_tree().create_timer(.9), "timeout")
	damage_taken = false
