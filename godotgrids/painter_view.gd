extends TileMapLayer

var painterIcons : Array = []

#know where the first position is for the Painter Icon
#set PainterIcon1 to that position
#set each painter icon after to an amount to the right

func _ready() -> void:
	painterIcons = get_all_children(get_node("."))
	print(painterIcons)

func get_all_children(node) -> Array:
	var nodes : Array = []

	for N in node.get_children():
		
		if N.get_child_count() > 0:
			nodes.append(N)
			node.append_array(get_all_children(N))
			
		else:
			nodes.append(N)
			
	return nodes
			

func _process(delta: float) -> void:
	pass
