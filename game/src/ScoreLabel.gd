extends Label


func start_blinking(sec):
	$BlinkTimer.start(sec)


func stop_blinking():
	show()
	$BlinkTimer.stop()


func _on_BlinkTimer_timeout():
	if is_visible():
		hide()
	else:
		show()
