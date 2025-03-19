extends CharacterBody2D

const speed = 300.0

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		orderCoffee();

func orderCoffee():
	var _tween = get_tree().create_tween();
	
	_tween.tween_property($IdeaBallon, "scale:y",0.15, 0.2).set_trans(Tween.TRANS_SPRING);
