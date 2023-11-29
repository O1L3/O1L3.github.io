extends StaticBody2D


var my_class_instance : Node2D
func _ready():
	my_class_instance = Node2D.new()
	my_class_instance.connect("my_signal", self, "_on_my_signal")
func _process(delta):
	move_local_y(5)
	var anim = $blue
	anim.play("default")

func _on_my_signal():
	position.x = 512
	position.y = 500


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
