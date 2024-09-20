extends Node2D

var inputInt = 0
var GridSize = 8
var Dic = {}
var rng = RandomNumberGenerator.new()
var tile
var painting: bool = false


@onready var background_layer: TileMapLayer = $BackgroundLayer
@onready var selection_layer: TileMapLayer = $SelectionLayer

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("1")):
		_changeInputInt(0)
	elif  (event.is_action_pressed("2")):
		_changeInputInt(1)
	elif (event.is_action_pressed("3")):
		_changeInputInt(2)
		
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			painting = true
		else:
			painting = false
			
func _changeInputInt(newInputInt: int):
	inputInt = newInputInt
	print(inputInt)

func _ready() -> void:
	for x in GridSize:
		for y in GridSize:
			var grassType: int = rng.randf_range(0,3)
			
			Dic[str(Vector2(x,y))] = {
				"Type": "Grass",
				"Position": str(Vector2(x,y))
			}
			background_layer.set_cell(Vector2(x,y), 0, Vector2i(grassType,0), 0)
	print(Dic)

#showing a selected cell
func _process(delta: float) -> void:
	
	tile = background_layer.local_to_map(get_local_mouse_position())
	
	for x in GridSize:
		for y in GridSize:
			selection_layer.erase_cell(Vector2(x,y))
	
	if Dic.has(str(tile)):
		selection_layer.set_cell(tile, 0, Vector2i(0,0), 0)
	
	if painting == true:
		if Dic.has(str(tile)):
			background_layer.set_cell(tile,0, Vector2i(inputInt,0), 0)
