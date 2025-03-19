extends Panel
class_name BaseMinigame;

## TODO: Create coffee classes
var selectedCoffeeVariant;
var minigameProgress: float;

signal minigame_complete;

func _ready() -> void:
	pass;

func _physics_process(delta: float) -> void:
	pass
	
func _on_minigame_completion() -> void:
	pass

func _on_close_button_pressed() -> void:
	var player: Player = get_tree().current_scene.get_node("Player")
	if player:
		player.isDoingMinigame = false;
	queue_free();
	
