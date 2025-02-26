extends Node

@export var frame_indicators: Array[Control]

var current_indicator_index: int = 0


func _process(delta: float) -> void:
	current_indicator_index += 1
	if current_indicator_index >= frame_indicators.size():
		current_indicator_index = 0
	
	for i: int in range(frame_indicators.size()):
		frame_indicators[i].visible = i == current_indicator_index
