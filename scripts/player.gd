extends CharacterBody2D
class_name Player

@onready var trajectory : Line2D = $Trajectory;
@onready var isDoingMinigame: bool = false;

var cursorInRange: bool = false;
var holdingPlayer: bool = false;
var launchPowerFactor: float = 10.0;

func _physics_process(delta: float) -> void:
	if (cursorInRange):
		_manage_hold();
	
	
	# Pegar a distancia e o angulo do mouse
	var mousePosition: Vector2 = get_global_mouse_position();
	var myPosition: Vector2 = global_position;
	
	var distanceToMouse: float = (abs(mousePosition - myPosition)).length()
	var angleToMouse : float = rad_to_deg(myPosition.angle_to_point(mousePosition));
	
	var reversedAngleToMouse: float = -sign(angleToMouse) * 180 + angleToMouse;
	var reversedAngleToMouseRad: float = deg_to_rad(reversedAngleToMouse);
	
	if (holdingPlayer):
		movement_foreshadow(reversedAngleToMouse, myPosition, mousePosition, delta);
		
	if (Input.is_action_just_released("hold")):
		_manage_release(distanceToMouse, reversedAngleToMouseRad);
			
	if velocity:
		velocity = lerp(velocity, Vector2.ZERO, 0.169);

	move_and_slide();

func _manage_release(distance, releaseAngle):
	if holdingPlayer:
		print("soltei aqui");
		trajectory.hide();
		var launchVector: Vector2 = Vector2(cos(releaseAngle) * distance,
											sin(releaseAngle) * distance);
		velocity = launchVector * launchPowerFactor;
			
	holdingPlayer = false;

func _manage_hold():
	if Input.is_action_pressed("hold"):
			print("segurando");
			holdingPlayer = true;

func movement_foreshadow (
	_angleToFace: float,
	_playerPos: Vector2, 
	_mousePos: Vector2, 
	delta: float) -> void:
	if (holdingPlayer):
		trajectory.show();
		rotation_degrees = _angleToFace;
		_update_trajectory(delta, (_mousePos - _playerPos))
	
	

func _on_texture_rect_mouse_entered() -> void:
	print("oi");
	cursorInRange = true;


func _on_texture_rect_mouse_exited() -> void:
	print("tchau");
	cursorInRange = false;
	
## Atualiza a trajetória do projétil
func _update_trajectory(delta, launchPower):
	trajectory.clear_points(); # limpa a trajetoria anterior
	var maxPoints: int = 75;
	var pos : Vector2 = Vector2.ZERO;
	var vel : Vector2 = -launchPower;
	for i in maxPoints:
		trajectory.add_point(pos);
		trajectory.global_rotation = 0;
		pos += vel * delta;
		if (pos.length() > launchPower.length() - 25):
			break
