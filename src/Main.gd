extends Node2D

const BOIDS_COUNT = 200

onready var boid_scene = preload("res://src/Boid.tscn")
onready var boids_container = $Boids

var boids = []

func _ready():
	for i in BOIDS_COUNT:
		var boid = boid_scene.instance()
		boids_container.add_child(boid)
		boids.push_back(boid)
	
	for boid in boids_container.get_children():
		boid.boids = boids
		
	if OS.get_name()=="HTML5":
		OS.set_window_maximized(true)

#func _process(delta):
#	for boid in boids_container.get_children():
#		boid.set_prey_position($Prey.position)

#func _input(event):
#	if event is InputEventMouseMotion:
#		for boid in boids_container.get_children():
#			boid.set_prey_position(event.position)
##	if event.is_action_pressed("ui_right"):
##		player.go_right()


#	if event is InputEventMouseButton and event.pressed:
#		for boid in boids_container.get_children():
#			boid.set_prey_position(event.position)
#			print('Mouse Pressed')
#func _input(event):
#   # Mouse in viewport coordinates.
#   if event is InputEventMouseButton:
#	   print("Mouse Click/Unclick at: ", event.position)
##   elif event is InputEventMouseMotion:
##	   print("Mouse Motion at: ", event.position)
#
#   # Print the size of the viewport.
##   print("Viewport Resolution is: ", get_viewport_rect().size)
#   print("Viewport get_mouse_position is: ", get_viewport().get_mouse_position())
