extends Control

func _ready():
	var _tween: Tween = get_tree().create_tween();
	var fade: ColorRect = get_node("ColorRect");
	
	fade.modulate.a = 1; # Inicia com opacidade total
	
	$ParticlesCoffee.emitting = true;
	_tween.tween_property(fade, "modulate:a", 0, 2.0);
	await $ParticlesCoffee.finished
	queue_free();
