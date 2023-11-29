extends CanvasLayer
var time : int = 0
onready var _pm = $ColorRect

func _process(delta):
	if time == 10:
		_pm.hide()

func _on_Timer_timeout():
	time = time + 1


func _on_ColorRect_hide():
	
	pass # Replace with function body.
