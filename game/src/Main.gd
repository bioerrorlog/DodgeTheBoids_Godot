extends Node2D

const BOIDS_COUNT = 10

onready var boid_scene = preload("res://src/Boid.tscn")

var boids = []

func _ready():
	for i in BOIDS_COUNT:
		var boid = boid_scene.instance()
		$Boids.add_child(boid)
		boids.push_back(boid)
	
	for boid in $Boids.get_children():
		boid.boids = boids
		
	if OS.get_name()=="HTML5":
		OS.set_window_maximized(true)


func _on_Player_hit():
	$Player.decrease_hit_point(1)
	$HUD.update_hp($Player.hit_point)
