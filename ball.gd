extends CharacterBody2D

var windowSize : Vector2
const startSpeed : int = 300
const acceleration : int = 50
var speed : int
var direction : Vector2
const maxY : float = 0.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	windowSize = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta : float) -> void:
	var collision = move_and_collide(direction * speed * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		if collider == $"../Player" or collider == $"/..Player2":
			speed += acceleration
			direction = chooseDirection(collider)
		#else:
			#direction = direction.bounce(collision.get_normal())
		elif collider == $"/..CPU" or collider == $"/..CPU2":
			speed += acceleration
			direction = chooseDirection(collider)
		else:
			direction = direction.bounce(collision.get_normal())

func newBall() -> void:
	position.x = windowSize.x/2
	position.y = randi_range(200, windowSize.y - 200)
	speed = startSpeed
	direction = randomDirection()
	
func randomDirection():
	var newDirection := Vector2()
	newDirection.x = [1,-1].pick_random()
	newDirection.y = randi_range(-1,1)
	return newDirection.normalized()
	
func chooseDirection(collider):
	var ballY = position.y
	var paddleY = collider.position.y
	var ballDistance = ballY - paddleY
	var newDirection := Vector2()
	if direction.x > 0:
		newDirection.x = -1
	else:
		newDirection.x = 1
	newDirection.y = (ballDistance / (collider.paddleHeight/2)) * maxY
	return newDirection.normalized()
