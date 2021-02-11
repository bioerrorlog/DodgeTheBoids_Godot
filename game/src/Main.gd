extends Node2D

onready var boid_scene = preload("res://src/Boid.tscn")

var boids = []
var score = 0
var is_game_live = false

func _ready():
		
	if OS.get_name()=="HTML5":
		OS.set_window_maximized(true)

func _process(delta):
	if is_game_live:
		score += 100 * delta
		$HUD.update_score(score)
	
	if $Player.hit_point <= 0:
		game_over()


func birth_boids(boids_count):
	for i in boids_count:
		var boid = boid_scene.instance()
		$Boids.add_child(boid)
		boids.push_back(boid)
	
	for boid in $Boids.get_children():
		boid.boids = boids
		
		
func game_over():
	$Player.game_over()
	$HUD.game_over()
	is_game_live = false


func remove_all_boids():
	for boid in $Boids.get_children():
		$Boids.remove_child(boid)
		boid.queue_free()
	boids = []

func _on_Player_hit():
	$Player.decrease_hit_point(1)
	$HUD.update_hp($Player.hit_point)


func _on_HUD_start_game():
	remove_all_boids()
	score = 0
	$HUD.update_score(score)
	$Player.game_start()
	is_game_live = true
	birth_boids(10)
