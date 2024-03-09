extends Area3D
class_name Selectable

signal selected
signal deselected

func select():
	selected.emit()

func deselect():
	deselected.emit()

func disable():
	set_collision_layer_value(1, false)

func enable():
	set_collision_layer_value(1, true)
