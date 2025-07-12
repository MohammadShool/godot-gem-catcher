extends Node2D

@export var gem_scene: PackedScene

@onready var score_label: Label = $Label

var _score: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_gem()
	format_score_label()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_gem() -> void:
	var x_pos:float = randf_range(0, get_viewport_rect().size.x)
	var new_gem:Gem = gem_scene.instantiate()
	new_gem.position = Vector2(x_pos, -50.0)
	new_gem.on_gem_off_screen.connect(game_over)
	add_child(new_gem)

func game_over() -> void:
	print("game over")

func _on_timer_timeout() -> void:
	spawn_gem()


func _on_paddle_area_entered(area: Area2D) -> void:
	_score+=1
	area.queue_free()
	format_score_label()
	
func format_score_label ():
	score_label.text= "your score is: %05d" % (_score)
