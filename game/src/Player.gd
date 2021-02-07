extends Area2D

signal hit

var screen_size
export var speed = 400
var hit_point = 10

func _ready():
	screen_size = get_viewport_rect().size
	position = Vector2(screen_size.x / 2, 0)


func _process(delta):
	var velocity = Vector2()
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity = velocity.normalized() * speed

	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, -100000000, screen_size.y)


func decrease_hit_point(damage_point):
	hit_point -= damage_point


func _on_Player_area_entered(area):
	emit_signal("hit")
	
