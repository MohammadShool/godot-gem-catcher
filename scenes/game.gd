extends Node2D

@export var gem_scene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_gem()


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
