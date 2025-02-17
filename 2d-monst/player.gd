extends Area2D
signal hit

@export var speed = 400.0
var screeen_size = Vector2.ZERO

func _ready():
	screeen_size = get_viewport_rect().size
	print(screeen_size)
	hide()



func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1	
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1	
	if direction.length() > 0:
		direction = direction.normalized()
		#error
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		#error
	position += direction *speed * delta	
	position.x = clamp(position.x,0,screeen_size.x)
	position.y = clamp(position.y,0,screeen_size.y)
	
	if direction.x != 0:
		$AnimatedSprite2D.animation = "right"
		$AnimatedSprite2D.flip_h = direction.x < 0
		$AnimatedSprite2D.flip_v  = false
	elif  direction.y != 0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = direction.y > 0
		
func start(new_position):
	position = new_position
	show()
	$CollisionShape2D.disabled = false

func _on_body_entered(body):
	hide()
	$CollisionShape2D.set_deferred("disabled",true)

	emit_signal("hit")
