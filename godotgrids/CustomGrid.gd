extends Node2D

var GridSize = 4
var Dic = {}
var rng = RandomNumberGenerator.new()

@onready var background_layer: TileMapLayer = $BackgroundLayer
@onready var selection_layer: TileMapLayer = $SelectionLayer
@onready var painter_view_layer: TileMapLayer = $PainterViewLayer


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
	var tile = background_layer.local_to_map(get_local_mouse_position())
	
	for x in GridSize:
		for y in GridSize:
			selection_layer.erase_cell(Vector2(x,y))
	
	if Dic.has(str(tile)):
		selection_layer.set_cell(tile, 0, Vector2i(0,0), 0)
		print(Dic[str(tile)])
