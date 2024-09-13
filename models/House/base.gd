extends Node3D

@export_subgroup("Shield")
@export var shield : Area3D
@export var shield_generator_particles : GPUParticles3D
@export var shield_manager : Node3D 
@export var health : int = 100
@export var generator : Node3D

var isShieldOn : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shield.visible = isShieldOn
	shield_generator_particles.emitting = isShieldOn

func toggle_shield() -> void:
	isShieldOn = !isShieldOn
	shield.visible = isShieldOn
	shield_generator_particles.emitting = isShieldOn

func add_battery(amount: int) -> void:
	var battery_gain = amount * 10
	shield_manager.battery += battery_gain
	shield_manager._on_timer_timeout()
	toggle_shield()

func _process(delta: float) -> void:
	if generator.can_be_used && Input.is_action_just_pressed("interact") && generator.player.batteries_held > 0:
		add_battery(generator.player.batteries_held)
		generator.player.batteries_held = 0
		generator.player.update_batteries(0)
