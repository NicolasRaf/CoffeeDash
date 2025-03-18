extends Control

var destinyScene: PackedScene;
var transIN: Node = preload("res://scenes/trasition_in.tscn").instantiate();

func _ready():
	var _tween: Tween = get_tree().create_tween();
	var fade: ColorRect = get_node("ColorRect");

	$ParticlesCoffee.emitting = true;
	$ParticlesCoffee.finished.connect(changeScene);
	_tween.tween_property(fade, "color:a", 1, 3);

func changeScene() -> void:
	var instScene = destinyScene.instantiate();
	get_tree().root.add_child(transIN);
	get_tree().current_scene.get_parent().add_child(instScene);
	get_tree().current_scene.queue_free();
	queue_free();
