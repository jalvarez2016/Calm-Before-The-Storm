extends Node3D

@export var timer : Timer
@export var battery : int
@export var loss_per_tick : int
@export var base : Node3D


func _on_timer_timeout() -> void:
	if battery - loss_per_tick >= 0:
		battery -= loss_per_tick
	elif battery -loss_per_tick < 0:
		battery = 0
		base.toggle_shield()
		return
	
	timer.start(2)
