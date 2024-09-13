extends Area3D

@export var batteries_held : int = 0
@export var battery_ui : Label

func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("Battery"):
		batteries_held += 1
		area.get_parent_node_3d().queue_free()
		update_batteries(batteries_held)

func update_batteries(amount: int) -> void :
	var new_ui_txt = ": {amount}/  10"
	battery_ui.text = new_ui_txt.format({"amount": amount})

func _ready() -> void:
	update_batteries(batteries_held)
