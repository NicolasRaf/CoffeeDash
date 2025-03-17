extends Control

var scene: PackedScene;
var transIN: Node = preload("res://scenes/trasition_in.tscn").instantiate();

func _ready():
	var _tween: Tween = get_tree().create_tween();
	var fade: ColorRect = get_node("ColorRect");

	$ParticlesCoffee.emitting = true;
	_tween.tween_property(fade, "color:a", 1, 2);
	_tween.finished.connect(changeScene);

func changeScene() -> void:
	var instScene = scene.instantiate();
	get_tree().root.add_child(transIN);
	get_tree().current_scene.get_parent().add_child(instScene);
	get_tree().current_scene.queue_free();
	queue_free();
