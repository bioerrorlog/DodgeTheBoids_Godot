extends Node2D

onready var boid_scene = preload("res://src/Boid.tscn")

var boids = []
var score = 0
var is_game_live = false

func _ready():
		
	if OS.get_name()=="HTML5":
		OS.set_window_maximized(true)

func _process(delta):
	
	if $Player.hit_point <= 0 and is_game_live:
		game_over()


func birth_boids(boids_count):
	for i in boids_count:
		var boid = boid_scene.instance().init($Player.position.x, $Player.position.y)
		$Boids.add_child(boid)
		boids.push_back(boid)
	
	for boid in $Boids.get_children():
		boid.boids = boids
		
	score += boids_count
	$HUD.update_score(score)
		
		
func game_over():
	$Player.game_over()
	$HUD.game_over()
	$BoidsTimer.stop()
	is_game_live = false


func remove_all_boids():
	for boid in $Boids.get_children():
		$Boids.remove_child(boid)
		boid.queue_free()
	boids = []

func _on_Player_hit():
	$Player.decrease_hit_point(1)
	$HUD.blink_HpLabel_color(0.2)
	$HUD.update_hp($Player.hit_point)


func _on_HUD_start_game():
	remove_all_boids()
	score = 0
	$Player.game_start()
	$HUD.update_hp($Player.hit_point)
	is_game_live = true
	birth_boids(10)
	$BoidsTimer.start()


func _on_BoidsTimer_timeout():
	birth_boids(1)
