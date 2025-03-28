extends Button

signal coffee_selected

func _on_pressed() -> void:
	emit_signal("coffee_selected");
	print("Café selecionado para fazer")
