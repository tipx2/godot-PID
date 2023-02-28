extends RigidBody

const SPEED = 10
onready var PID = get_node("PID")

# targets
export(NodePath) onready var targetHolder = get_node_or_null(targetHolder)
var target_arr = []
var current_target = 0

func _ready():
	# boilerplate connections
	Globals.connect("P_gain_changed", self, "P_gain_changed")
	Globals.connect("I_gain_changed", self, "I_gain_changed")
	Globals.connect("D_gain_changed", self, "D_gain_changed")
	Globals.connect("target_changed", self, "target_changed")
	
	
	for target in targetHolder.get_children():
		target_arr.append(target.global_transform.origin)
	
	print(target_arr[current_target].x)

func _physics_process(delta):
	var dir = PID.update(delta, global_transform.origin.x, target_arr[current_target].x)
	add_force(Vector3(dir * SPEED, 0, 0), Vector3.ZERO)

func P_gain_changed():
	PID.P_gain = Globals.P_gain

func I_gain_changed():
	PID.I_gain = Globals.I_gain

func D_gain_changed():
	PID.D_gain = Globals.D_gain

func target_changed():
	current_target = Globals.target
