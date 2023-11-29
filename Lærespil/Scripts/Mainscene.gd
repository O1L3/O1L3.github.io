extends Node2D
var time : int = 0
var health : int = 100
var wordOne : String = "elephant"
var wordTwo : String = "fire"
var wordThree : String = "dog"
var wordFour : String = "chair"
var wordFive : String = "wizard"
var word : String
var damage_taken : bool = false
signal my_signal


var wordS : String
var wordOneS : String = "Oversæt ELEFANT til engelsk"
var wordTwoS : String = "Oversæt ILD til engelsk"
var wordThreeS : String = "Oversæt HUND til engelsk"
var wordFourS : String = "Oversæt STOL til engelsk"
var wordFiveS : String = "Oversæt TROLDMAND til engelsk"

func _ready():
	$Textbox.connect("text_changed", self, "on_text_changed")
	update_points_label()

func _process(delta):
	if health <= 0:
		win()
	if time >= 10 and time <= 20 :
		word = wordOne
		if damage_taken == false:
			wordS = wordOneS
			$Label.text = wordS
			$TextureRect.visible = true
		else:
			$Label.text = " "
	elif time >= 30 and time <=40:
		word = wordTwo
		if damage_taken == false:
			wordS = wordTwoS
			$Label.text = wordS
			$TextureRect.visible = true
		else:
			$Label.text = " "
	elif time >= 50 and time <=60:
		word = wordThree
		if damage_taken == false:
			wordS = wordThreeS
			$Label.text = wordS
			$TextureRect.visible = true
		else:
			$Label.text = " "
	elif time >= 70 and time <=80:
		word = wordFour
		if damage_taken == false:
			wordS = wordFourS
			$Label.text = wordS
			$TextureRect.visible = true
		else:
			$Label.text = " "
	elif time >= 90 and time <=100:
		word = wordFive
		if damage_taken == false:
			wordS = wordFiveS
			$Label.text = wordS
			$TextureRect.visible = true
		else:
			$Label.text = " "
	else:
		$Label.text = " "
		$TextureRect.visible = false
	if time == 10 or time == 30 or time == 50 or time == 70 or time == 90:
		damage_taken = false
	print(time)


func on_text_changed(new_text):
	
	if damage_taken == false:
		if time >= 10 and time <= 20 or  time >= 30 and time <=40 or time >= 50 and time <=60 or time >= 70 and time <=80 or time >= 90 and time <=100:
			if new_text.to_lower() == word:
				$Textbox.text = ""
				$TextureRect.visible = false
				damage_taken = true
				emit_signal("my_signal")
				_on_Mainscene_my_signal()
				yield(get_tree().create_timer(.9), "timeout")
				yield(get_tree().create_timer(.5), "timeout")
				health -= 25
				update_points_label()


func update_points_label():
	var healthbar = $Healthbar
	healthbar.value = health

func win():
	get_tree().change_scene("res://Scenes/win.tscn")

func _on_Timer_timeout():
	time = time +1
	
	


func _on_Mainscene_my_signal():
	pass # Replace with function body.
