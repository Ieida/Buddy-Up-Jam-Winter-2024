extends Resource
class_name BuildOption

signal picked

@export var option_name: String
@export var building: PackedScene

func pick():
	picked.emit()
