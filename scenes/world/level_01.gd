extends Node2D

#
#@export var max_enemies: int = 6
#@export var spawn_timer: Timer
#
#var spawn_positions: Array[Vector2] = []
#var enemies_spawned: int = 0
#@onready var tile_map: TileMapLayer = $TileMapLayer
#@export var tile_source_id: int = 0
#
#var level_data := ["XXXXX     XXXXXXXX     XXXXX",
					#"","","","",
					#"   XXXXXXX        XXXXXXX   ",
					#"","","",
		   		 	#"   XXXXXXXXXXXXXXXXXXXXXX   ",
		   			#"","","",
					#"XXXXXXXXX          XXXXXXXXX",
					#"","",""]
#
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#setup_spawner()
	#generate_level(level_data)
	#
	#center_tilemap(level_data)
#
#var block_atlas_coords: Vector2i = Vector2i(0, 0)

#func setup_spawner() -> void:
	#if spawn_positions.is_empty():
		#return
### Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta: float) -> void:
	##pass
#
#func generate_level(layout: Array) -> void:
	#tile_map.clear()
	#for y in range(layout.size()):
		#var row: String = layout[y]
		#
		#for x in range(row.length()):
			#if row[x] == "X":
				#tile_map.set_cell(Vector2i(x,y),tile_source_id, block_atlas_coords)
#
#func center_tilemap(layout: Array) -> void:
	#var tile_size: Vector2 =  tile_map.tile_set.tile_size
	#var max_col: int = 0
	#var row_count = 0 
	#
	#for row in layout:
		#row_count += 1
		#if row.length() > max_col:
			#max_col = row.length()
	#
	#var level_w: float = max_col * tile_size.x
	#var level_h: float = row_count * tile_size.y
	#
	#var viewport_size: Vector2 = get_viewport_rect().size
	#
	#var offset_x: float = (viewport_size.x - level_w) / 2.0
	#var offset_y: float = (viewport_size.y - level_h) / 2.0
	#
	#tile_map.position = Vector2(offset_x, offset_y)
