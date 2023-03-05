extends Spatial

onready var PID = get_parent().get_node("PID")

func _physics_process(delta):
	var P_scale = (PID.error * Globals.P_gain)
	$P_arrow_holder.scale = Vector3(P_scale, 1, 1)
	
	var I_scale = (PID.integration_stored * Globals.I_gain)
	$I_arrow_holder.scale = Vector3(I_scale, 1, 1)
	
	var D_scale = (-PID.rate_of_currentValue * Globals.D_gain)
	$D_arrow_holder.scale = Vector3(D_scale, 1, 1)
	
	var CF_scale = Globals.constant_force
	$Constant_force_holder.scale = Vector3(CF_scale, 1, 1)
