extends Area3D

@export var batteries_held : int = 0
@export var battery_ui : Label

@export var ammunition_held : int = 0
@export var ammunition_ui : Label

func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("Battery"):
		batteries_held += 1
		area.get_parent_node_3d().queue_free()
		update_batteries(batteries_held)
	elif area.is_in_group("ammunition"):
		ammunition_held += 1
		area.get_parent_node_3d().queue_free()
		update_ammunition(ammunition_held)

func update_batteries(amount: int) -> void :
	var new_ui_txt = ": {amount}/  10"
	battery_ui.text = new_ui_txt.format({"amount": amount})

func update_ammunition(amount: int) -> void :
	var new_ui_txt = ": {amount}/  10"
	ammunition_ui.text = new_ui_txt.format({"amount": amount})

func _ready() -> void:
	update_batteries(batteries_held)
	update_ammunition((ammunition_held))
