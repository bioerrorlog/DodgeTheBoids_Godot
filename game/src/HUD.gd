extends CanvasLayer

signal start_game

func update_hp(hp):
	$HpLabel.text = "HP: %s" % hp
	

func update_score(score):
	$ScoreLabel.text = "Score: %s" % int(score)


func game_over():
	show_message("Game Over")
	$StartButton.text = "Retry"
	$StartButton.show()


func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()


func _on_StartButton_pressed():
	$StartButton.hide()
	$HpLabel.show()
	$ScoreLabel.show()
	$MessageLabel.hide()
	emit_signal("start_game")
