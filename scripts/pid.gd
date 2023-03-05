extends Node

# PID coefficients
var P_gain = 0.0
var I_gain = 0.0
var D_gain = 0.0

var valueLast : float # used to calculate derivative to combat derivative kick
var derivative_initialised = false # used to skip the first rate of change calculation so there is no initial kick

var integration_stored : float # used to sum the error over time to combat steady state error
export(float) var integral_saturation # used to combat integral windup

var error : float # variable used for all calculations, abs(error) == distance
var rate_of_currentValue : float # used for D term

# call this however often dt (the time step) is
func update(dt : float, currentValue : float, targetValue : float) -> float:
	error = targetValue - currentValue
	# calculate proportional term
	var P = P_gain * error
	
	
	# calculate the derivative term
	
	# check if we're calculating derivative for the first time, skip if so
	if derivative_initialised:
		# calculate the rate of change of currentValue
		rate_of_currentValue = (currentValue - valueLast) / dt
		valueLast = currentValue
	else:
		derivative_initialised = true
	
	# multiply by D coefficient
	var D = D_gain * -rate_of_currentValue
	
	
	# calculate the integral term
	integration_stored = clamp(integration_stored + (error * dt), -integral_saturation, integral_saturation)
	var I = I_gain * integration_stored
	
	return P + I + D

func reset() -> void:
	# used if PID is moved by external means, or if the controller is turned off for long period
	derivative_initialised = false
