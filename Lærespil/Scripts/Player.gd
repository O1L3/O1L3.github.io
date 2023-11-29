extends KinematicBody2D
var velocity = Vector2()
const speed = 300.0
const acceleration = 60.0
var playerHP : int = 3


func _physics_process(delta):
	animate(1)
	if Input.is_action_pressed("ui_down"):
		velocity.y = min(velocity.y + acceleration, speed)
	elif Input.is_action_pressed("ui_up"):
		velocity.y = max(velocity.y - acceleration, -speed)
	elif Input.is_action_pressed("ui_right"):
		velocity.x = min(velocity.x + acceleration, speed)
	elif Input.is_action_pressed("ui_left"):
		velocity.x = max(velocity.x - acceleration, -speed)
	else:
		if velocity.x > (acceleration-1):
			velocity.x -= acceleration
		elif velocity.x < -(acceleration-1):
			velocity.x += acceleration
		else:
			velocity.x = 0
		if velocity.y > (acceleration-1):
			velocity.y -= acceleration
		elif velocity.y < -(acceleration-1):
			velocity.y += acceleration
		else:
			velocity.y = 0
		
	
	velocity = move_and_slide(velocity, Vector2(0,-1))

func animate(movement):
	var anim = $AnimatedSprite
	if movement == 1:
		anim.play("walking")
