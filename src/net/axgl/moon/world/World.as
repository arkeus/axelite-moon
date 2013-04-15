package net.axgl.moon.world {
	import net.axgl.lib.tiled.TiledLayer;
	import net.axgl.lib.tiled.TiledMap;
	import net.axgl.lib.tiled.TiledObjectLayer;
	import net.axgl.lib.tiled.TiledTile;
	import net.axgl.lib.tiled.TiledTileLayer;
	import net.axgl.lib.tiled.TiledTileset;
	import net.axgl.moon.assets.Resource;
	
	import org.axgl.Ax;
	import org.axgl.AxGroup;
	import org.axgl.render.AxColor;
	import org.axgl.tilemap.AxTilemap;

	public class World extends AxGroup {
		private static const TILESET_NAME:String = "tileset";
		private static const COLLISION_TERRAIN_NAME:String = "collision";
		private static const COLLISION_OVERRIDE_FLAG:String = "override";
		
		public var collision:CollisionMap;
		public var tilemaps:Vector.<AxTilemap>; // not needed?
		
		private var collisionFlagMap:Vector.<uint>;
		private var collisionOverrideMap:Vector.<Boolean>;
		
		public function World() {
			tilemaps = new Vector.<AxTilemap>;
		}
		
		public function build(map:TiledMap):World {
			for each(var layer:TiledLayer in map.layers.getVisibleLayers()) {
				if (layer is TiledTileLayer) {
					var tilemap:AxTilemap = new AxTilemap;
					var tileLayer:TiledTileLayer = layer as TiledTileLayer;
					tilemap.build(tileLayer.data, Resource.TILESET, map.tileWidth, map.tileHeight, 0);
					this.add(tilemap);
					tilemaps.push(tilemap);
				} else if (layer is TiledObjectLayer) {
					
				}
			}
			Ax.background = AxColor.fromHex(map.backgroundColor);
			
			createCollisionMaps(map);
			collision = new CollisionMap(map.width, map.height);
			for each(layer in map.layers.getTileLayers()) {
				applyCollision((layer as TiledTileLayer).data, collisionFlagMap);
			}
			this.add(collision);
			collision.initialize();
			
			return this;
		}
		
		private function createCollisionMaps(map:TiledMap):void {
			var tileset:TiledTileset = map.tilesets.getTilesetByName(TILESET_NAME);
			
			collisionFlagMap = new Vector.<uint>;
			collisionOverrideMap = new Vector.<Boolean>;
			
			var cid:int = -1, i:uint = 0;
			for (var t:String in tileset.terrain) {
				if (t == COLLISION_TERRAIN_NAME) {
					cid = i;
					break;
				}
				i++;
			}
			
			if (cid == -1) {
				throw new Error("No collision terrain data found in tileset");
			}
			
			for (var tid:String in tileset.tiles) {
				var tidInt:uint = parseInt(tid);
				if (collisionFlagMap.length <= tidInt) {
					collisionOverrideMap.length = collisionFlagMap.length = tidInt + 1;
				}
				collisionFlagMap[tidInt] = TERRAIN_TO_SIDE_MAP[(tileset.tiles[tid] as TiledTile).terrain];
				collisionOverrideMap[tidInt] = (tileset.tiles[tid] as TiledTile).properties.get("collisionType") == COLLISION_OVERRIDE_FLAG;
			}
		}
		
		private function applyCollision(data:Array, collisionFlagMap:Vector.<uint>):void {
			for (var y:uint = 0; y < data.length; y++) {
				for (var x:uint = 0; x < data[y].length; x++) {
					if (data[y][x] > 0) {
						var tid:uint = data[y][x] - 1;
						if (collisionOverrideMap[tid]) {
							collision.set(x, y, collisionFlagMap[data[y][x] - 1]);
						} else {
							collision.apply(x, y, collisionFlagMap[data[y][x] - 1]);
						}
					}
				}
			}
		}
		
		private static const TERRAIN_TO_SIDE_MAP:Vector.<uint> = new <uint>[
			NONE,
			NONE,
			NONE,
			UP,
			NONE,
			LEFT,
			NONE,
			UP | LEFT,
			NONE,
			NONE,
			RIGHT,
			UP | RIGHT,
			DOWN,
			DOWN | LEFT,
			DOWN | RIGHT,
			ANY
		];
	}
}
