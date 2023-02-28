extends Control

func _on_dropdown_pressed():
	$VBoxContainer/ColorRect.visible = !$VBoxContainer/ColorRect.visible


func _on_target_SpinBox_value_changed(value):
	Globals.target = value

func _on_ProportionalGain_SpinBox_value_changed(value):
	Globals.P_gain = value

func _on_IntegralGain_SpinBox_value_changed(value):
	Globals.I_gain = value

func _on_DerivativeGain_SpinBox2_value_changed(value):
	Globals.D_gain = value


func _on_reset_pressed():
	get_tree().quit()
