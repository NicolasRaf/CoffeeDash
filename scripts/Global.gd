extends Node

const _scenesBase : Dictionary[String, PackedScene] = {
	"transition": preload("res://scenes/trasition_out.tscn"),
	"test": preload("res://scenes/level_test.tscn")
};

func transitonToScene(destiny: String) -> void:
	if not _scenesBase.has(destiny):  return;
	var destinyScene : PackedScene = _scenesBase[destiny];
	
	var trans: Control = _scenesBase["transition"].instantiate();
	trans.destinyScene = destinyScene;
	
	get_tree().root.add_child(trans);
