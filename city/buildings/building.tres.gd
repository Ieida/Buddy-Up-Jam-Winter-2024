extends Node3D
class_name Building

signal destroyed

@export var selectable: Selectable
@export var build_ui: BuildUI
@export var material: Material
@export var destroy_particles: GPUParticles3D

func _ready():
	selectable.selected.connect(_on_selectable_selected)
	selectable.deselected.connect(_on_selectable_deselected)
	
	var no = BuildOption.new()
	no.option_name = "Destroy"
	no.picked.connect(destroy)
	build_ui.add_option(no)

func _on_selectable_selected():
	material.albedo_color = Color.AQUAMARINE
	build_ui.activate()

func _on_selectable_deselected():
	material.albedo_color = Color.GRAY
	build_ui.deactivate()

func destroy():
	selectable.deselect()
	selectable.disable()
	destroy_particles.restart()
	await destroy_particles.finished
	destroyed.emit()
	queue_free()
