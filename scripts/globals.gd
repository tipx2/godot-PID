extends Node

signal P_gain_changed
signal I_gain_changed
signal D_gain_changed
signal target_changed
signal constant_force_changed

var P_gain = 0.0 setget P_gain_changed
var I_gain = 0.0 setget I_gain_changed
var D_gain = 0.0 setget D_gain_changed

var target = 0 setget target_changed

var constant_force = 0.0 setget constant_force_changed

func P_gain_changed(new_value):
	P_gain = new_value
	emit_signal("P_gain_changed")

func I_gain_changed(new_value):
	I_gain = new_value
	emit_signal("I_gain_changed")

func D_gain_changed(new_value):
	D_gain = new_value
	emit_signal("D_gain_changed")

func target_changed(new_value):
	target = new_value
	emit_signal("target_changed")

func constant_force_changed(new_value):
	constant_force = new_value
	emit_signal("constant_force_changed")
