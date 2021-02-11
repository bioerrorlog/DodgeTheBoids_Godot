extends CanvasLayer

signal start_game

func update_hp(hp):
	$HpLabel.text = "HP: %s" % hp
	

func update_score(score):
	$ScoreLabel.text = "%s boids" % int(score)


func blink_HpLabel_color(sec):
	$HpLabel.modulate = Color(1, 0, 0) # red shade
	$HitTimer.start(sec)
	

func game_over():
	show_message("Game Over")
	$StartButton.text = "Retry"
	$StartButton.show()
	$HpLabel.hide()
	$ScoreLabel.start_blinking(0.5)


func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()


func _on_StartButton_pressed():
	$StartButton.hide()
	$HpLabel.show()
	$ScoreLabel.stop_blinking()
	$ScoreLabel.show()
	$MessageLabel.hide()
	emit_signal("start_game")


func _on_HitTimer_timeout():
	$HpLabel.modulate = Color(1, 1, 1)
