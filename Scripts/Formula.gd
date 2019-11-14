extends RigidBody2D

export var max_speed = 500.0

signal lives
signal score

func _integrate_forces(state):
    if state.linear_velocity.length() > max_speed:
        state.linear_velocity = state.linear_velocity.normalized() * max_speed

func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)
	var WorldNode = get_node("/root/World")
	connect("score", WorldNode, "increase_score")
	connect("lives", WorldNode, "decrease_lives")

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("Tiles"):
			emit_signal("score", body.score)
			body.find_node("Coins").emitting = true
			body.die()
		if body.get_name() == "Formula":
			pass

	if position.y > get_viewport_rect().end.y:
		emit_signal("lives")
		queue_free()
