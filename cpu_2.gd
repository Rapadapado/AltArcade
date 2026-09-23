extends StaticBody2D

var windowHeight : int
var paddleHeight : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	windowHeight = get_viewport_rect().size.y
	paddleHeight = $ColorRect.get_size().y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta : float) -> void:
	if Input.is_key_pressed(KEY_U):
		position.y -= get_parent().paddleSpeed * delta
	elif Input.is_key_pressed(KEY_J):
		position.y += get_parent().paddleSpeed * delta

	position.y = clamp(position.y, paddleHeight/2, windowHeight-paddleHeight/2)

#var ballPosition : Vector2
#var CPU2distance: int
#var distanceX : int
#var movePaddle: int
#var windowHeight : int
#var paddleHeight : int
#var paddleWidth : int

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	windowHeight = get_viewport_rect().size.y
#	paddleHeight = $ColorRect.get_size().y
#	paddleWidth = $ColorRect.get_size().x


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	ballPosition = $"../Ball".position
#	CPU2distance = position.y - ballPosition.y
#	distanceX = position.x - ballPosition.x
	
#	if abs(CPU2distance) > get_parent().paddleSpeed * delta:
#		movePaddle = get_parent().paddleSpeed * delta * (CPU2distance / abs(CPU2distance))
#		position.y += movePaddle
#	else:movePaddle = CPU2distance
	
#	if abs(CPU2distance) < ballPosition.x:
#		movePaddle = get_parent().paddleSpeed * delta 
#		position.y -= movePaddle
#	else:
#		movePaddle = CPU2distance
	
	#position.y += movePaddle
	
#	position.y = clamp(position.y, paddleHeight/2, windowHeight-paddleHeight/2)
