extends Area2D


var my_class_instance : Node2D
func _ready():
	my_class_instance = Node2D.new()
	my_class_instance.connect("my_signal", self, "_on_my_signal")

func _process(delta):
	move_local_y(-5)


func _on_my_signal():
	position.x = 512
	position.y = 500


func _on_Mainscene_my_signal():
	position.x = 512
	position.y = 500

