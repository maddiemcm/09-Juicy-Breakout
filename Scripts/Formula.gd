extends RigidBody2D

export var maxspeed = 300

signal lives
signal score

func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("Tiles"):
			emit_signal("score", body.score)
			body.queue_free()
		if body.get_name() == "Formula":
			pass
			
	if position.y > get_viewport_rect().end.y:
		emit_signal("lives")
		queue_free()