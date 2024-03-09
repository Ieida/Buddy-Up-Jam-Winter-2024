extends Control
class_name BuildUI

signal option_picked()

@export var option_container: Container
@export var option_button: PackedScene
var options: Dictionary

func _ready():
	deactivate()

func add_option(option: BuildOption):
	var b = option_button.instantiate() as Control
	option_container.add_child(b)
	b._init_option(option)
	options[option.option_name] = b

func remove_option(option_name: String):
	if options.has(option_name):
		options[option_name].queue_free()
		options.erase(option_name)

func activate():
	show()

func deactivate():
	hide()
