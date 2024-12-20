extends CanvasLayer

signal start_game

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start(3)


func show_game_over():
	show_message("You need\nan X-Ray")
	var sprite = $Alistair
	sprite.visible = true
	await $MessageTimer.timeout
	$MessageLabel.text = "ClassiKyle\n\nDodge the\nData Chaos"
	sprite.visible = false
	$MessageLabel.show()
	await get_tree().create_timer(1).timeout
	$StartButton.show()


func update_score(score):
	$ScoreLabel.text = str(score)


func _on_StartButton_pressed():
	$StartButton.hide()
	start_game.emit()


func _on_MessageTimer_timeout():
	$MessageLabel.hide()
