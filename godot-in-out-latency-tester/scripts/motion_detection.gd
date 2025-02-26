extends Control

var grabCursor = true;
var previous_mouse_pos: Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var rest_postion: Vector2i = %MouseBackground.position + (%MouseBackground.size / 2.0)
	var movement_target_position: Vector2 = position + (%MouseBackground.size / 2.0)
	
	var current_mouse_pos: Vector2 = get_viewport().get_mouse_position()
	var movement_detected: bool = previous_mouse_pos != current_mouse_pos && (round(current_mouse_pos) as Vector2i != rest_postion)
	previous_mouse_pos = current_mouse_pos;
	
	visible = movement_detected;
	
	if Input.is_action_just_pressed("ui_text_delete"):
		grabCursor = !grabCursor;
	
	if grabCursor:
		if movement_detected:
			get_viewport().warp_mouse(movement_target_position);
		elif round(current_mouse_pos) as Vector2i != rest_postion:
			get_viewport().warp_mouse(rest_postion);
