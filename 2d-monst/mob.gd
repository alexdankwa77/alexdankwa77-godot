extends RigidBody2D

@export var min_speed = 150.0
@export var max_speed = 250.0


# Called when the node enters the scene tree for the first time.
func _ready():
	#randomize()
	# Replace with function body.
	#$AnimatedSprite2D.playing = true
	$AnimatedSprite2D.play()
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.animation = mob_types[randi() % mob_types.size()]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
