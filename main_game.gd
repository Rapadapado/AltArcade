extends Sprite2D

var score := [-2, -2]
const paddleSpeed : int = 500

func _on_timer_timeout():
	$Ball.newBall()
	$AudioStreamPlayer2D.play()

func _on_left_body_entered(body) -> void:
	score[1] += 1
	$Score/CPU.text = str(score[1])
	$Timer.start()

func _on_right_body_entered(body) -> void:
	score[0] += 1
	$Score/Player.text = str(score[0])
	$Timer.start()
