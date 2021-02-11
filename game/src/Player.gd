extends Area2D

signal hit

var screen_size
export var speed = 400
var hit_point = 10
var is_live = true

func _ready():
	screen_size = get_viewport_rect().size
	set_position_to_start_point()


func _process(delta):
	
	if not is_live:
		return
		
	var velocity = Vector2()
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity = velocity.normalized() * speed

	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, -100000000, screen_size.y)


func set_position_to_start_point():
	set_position(Vector2(screen_size.x/2, screen_size.y/2))

func decrease_hit_point(damage_point):
	hit_point -= damage_point
	

func set_hit_point(point):
	hit_point = point
	

func game_start():
	set_hit_point(10)
	set_position_to_start_point()
	$CollisionShape2D.set_deferred("disabled", false)
	is_live = true
	show()
	
	
func game_over():
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	is_live = false


func _on_Player_area_entered(area):
	emit_signal("hit")
	
