extends Node3D

@export var label : Label3D

var player : Node3D
var can_be_used : bool = false

func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.is_in_group("Player"):
		label.visible = true
		can_be_used = true
		player = area

func _on_area_3d_area_exited(area: Area3D) -> void:
	if area.is_in_group("Player"):
		label.visible = false
		can_be_used = false
		player = area
