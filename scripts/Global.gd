extends Node

const _scenesBase : Dictionary[String, PackedScene] = {
	"transition": preload("res://scenes/trasition_out.tscn"),
	"test": preload("res://scenes/level_test.tscn")
};

func transitonToScene(destiny) -> void:
	if not _scenesBase.has(destiny):  return;
	
	var destinyScene : PackedScene = _scenesBase[destiny];
	
	var trans = _scenesBase["transition"].instantiate();
	trans.scene = destinyScene;
	
	get_tree().root.add_child(trans);
