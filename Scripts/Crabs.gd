extends KinematicBody2D

var new_formula = preload("res://Scenes/Formula.tscn")

func _ready():
	set_process_input(true)

func _physics_process(delta):
	var mouse = get_viewport().get_mouse_position()
	var target_x = mouse.x
	var target_y = mouse.y
	var vp = get_viewport().get_visible_rect().size
	target_y = min(target_y, vp.y)
	target_y = max(target_y, vp.y - 200)
	position = Vector2(target_x, target_y)
	
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if not get_parent().has_node("Formula"):
			var formula = new_formula.instance()
			formula.position = position - Vector2(0,20)
			formula.name = "Formula"
			formula.linear_velocity = Vector2(200, -200)
			get_parent().add_child(formula)