extends Control
class_name BaseCoffeeBean

var mouseEntered: bool = false;

func _on_area_mouse_entered() -> void:
	mouseEntered = true;


func _on_area_mouse_exited() -> void:
	mouseEntered = false;



func _on_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (mouseEntered):
		if (event.is_action("click")):
			queue_free();
