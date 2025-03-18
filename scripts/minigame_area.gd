extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		print("Pinto pelado preto confuso n sei dirigir");
		var minigameScene = preload("res://scenes/test/minigame_window.tscn")
		var minigame = minigameScene.instantiate();
		
		# Window center position
		var windowOffsetX = get_window().get_viewport().size.x/2 - minigame.size.x
		var windowOffsetY = get_window().get_viewport().size.y/2 - minigame.size.y
		
		minigame.global_position = Vector2(windowOffsetX, windowOffsetY);
		get_tree().current_scene.add_child(minigame)
