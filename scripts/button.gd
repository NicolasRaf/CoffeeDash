extends Button

@export var destiny: String; 

func _ready():
	grab_focus();
	connect("mouse_entered", _interactionHandle.bind(true));
	connect("mouse_exited", _interactionHandle.bind(false));
	connect("focus_entered", _interactionHandle.bind(true));
	connect("focus_exited", _interactionHandle.bind(false));

func _interactionHandle(increase: bool):
	var _tween: Tween = get_tree().create_tween();
	
	if increase:
		_tween.tween_property(self, "scale", Vector2(1.05, 1.05), 0.2);
	else:
		_tween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.2);
		

func onPressed():
	print("Apertado");
	Global.transitonToScene(destiny);
