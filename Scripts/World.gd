extends Node2D

export var score = 0
export var lives = 3

func increase_score(s):
	score += int(s)
	find_node("Score").update_score()
	
func decrease_lives():
	lives -= 1
	find_node("Lives").update(lives)