extends KinematicBody2D

var new_formula = preload("res://Scenes/Formula.tscn")

func _ready():
	set_process_input(true)

func _physics_process(delta):
	var mouse_x = get_viewport().get_mouse_position().x 
	position = Vector2(mouse_x, position.y)
	
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if not get_parent().has_node("Formula"):
			var formula = new_formula.instance()
			formula.position = position - Vector2(0,20)
			formula.name = "Formula"
			formula.linear_velocity = Vector2(200, -200)
			get_parent().add_child(formula)
			var puff = load("res://Scenes/Puff.tscn").instance()
			puff.emitting = true
			get_parent().add_child(puff)