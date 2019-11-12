extends StaticBody2D

var one = preload("res://Assets/MoneyTile.png")
var two = preload("res://Assets/MoneyTile2.png")
var three = preload("res://Assets/MoneyTile.png")
var four = preload("res://Assets/MoneyTile2.png")
var five = preload("res://Assets/MoneyTile.png")
var six = preload("res://Assets/MoneyTile2.png")

onready var sprite = get_node("Sprite")
var score = 10

func _ready():
	if get_parent().name == "Tile 1":
		sprite.set_texture(one)
	if get_parent().name == "Tile 2":
		sprite.set_texture(two)
		score = 20
	if get_parent().name == "Tile 3":
		sprite.set_texture(three)
		score = 40
	if get_parent().name == "Tile 4":
		sprite.set_texture(four)
		score = 60
	if get_parent().name == "Tile 5":
		sprite.set_texture(five)
		score = 80
	if get_parent().name == "Tile 6":
		sprite.set_texture(six)
		score = 100
