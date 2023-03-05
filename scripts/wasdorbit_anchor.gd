extends Spatial

const MOVE_AMOUNT = 0.1
const ROTATE_AMOUNT = 1

func _physics_process(delta):
	if Input.is_action_pressed("rotate_left"):
		rotation_degrees.y += ROTATE_AMOUNT
	if Input.is_action_pressed("rotate_right"):
		rotation_degrees.y -= ROTATE_AMOUNT
	
	if Input.is_action_pressed("rotate_up"):
		rotation_degrees.x -= ROTATE_AMOUNT
	if Input.is_action_pressed("rotate_down"):
		rotation_degrees.x += ROTATE_AMOUNT
	
	
	if Input.is_action_pressed("move_in"):
		$orbitcam.transform.origin.z -= MOVE_AMOUNT
	if Input.is_action_pressed("move_out"):
		$orbitcam.transform.origin.z += MOVE_AMOUNT
