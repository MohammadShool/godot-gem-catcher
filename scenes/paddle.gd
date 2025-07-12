extends Area2D

@export var speed: float = 60.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var axis:float = 0.0
	
	if Input.is_action_pressed("left"):
		axis = -1.0
	elif Input.is_action_pressed("right"):
		axis = 1.0
	position.x += axis * speed * delta


func _on_area_entered(area: Area2D) -> void:
	print(area)
	
