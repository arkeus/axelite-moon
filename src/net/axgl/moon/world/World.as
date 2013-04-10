package net.axgl.moon.world {
	import net.axgl.lib.tiled.TiledLayer;
	import net.axgl.lib.tiled.TiledMap;
	import net.axgl.lib.tiled.TiledTerrain;
	import net.axgl.lib.tiled.TiledTile;
	import net.axgl.lib.tiled.TiledTileset;
	import net.axgl.moon.assets.Resource;
	
	import org.axgl.Ax;
	import org.axgl.AxGroup;
	import org.axgl.render.AxColor;
	import org.axgl.tilemap.AxTilemap;
	import org.axgl.util.AxProfiler;

	public class World extends AxGroup {
		private static const TILESET_NAME:String = "tileset";
		private static const COLLISION_TERRAIN_NAME:String = "collision";
		
		public var collision:CollisionMap;
		public var tilemaps:Vector.<AxTilemap>; // not needed?
		
		public function World() {
			tilemaps = new Vector.<AxTilemap>;
		}
		
		public function build(map:TiledMap):World {
			for each(var layer:TiledLayer in map.layers.getVisibleLayers()) {
				var tilemap:AxTilemap = new AxTilemap;
				tilemap.build(layer.data, Resource.TILESET, map.tileWidth, map.tileHeight, 0);
				this.add(tilemap);
				tilemaps.push(tilemap);
			}
			Ax.background = AxColor.fromHex(map.backgroundColor);
			
			var collisionFlagMap:Vector.<uint> = createCollisionFlagMap(map);
			collision = new CollisionMap(map.width, map.height);
			for each(layer in map.layers.getAllLayers()) {
				applyCollision(layer.data, collisionFlagMap);
			}
			this.add(collision);
			collision.initialize();
			
			return this;
		}
		
		private function createCollisionFlagMap(map:TiledMap):Vector.<uint> {
			var cfm:Vector.<uint> = new Vector.<uint>;
			var tileset:TiledTileset = map.tilesets.getTilesetByName(TILESET_NAME);
			
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
				if (cfm.length <= tidInt) {
					cfm.length = tidInt + 1;
				}
				cfm[parseInt(tid)] = TERRAIN_TO_SIDE_MAP[(tileset.tiles[tid] as TiledTile).terrain];
			}
			
			return cfm;
		}
		
		private function terrainToCollisionFlag(terrain:String, cid:String):uint {
			var t:Array = terrain.split(",");
			if (t.length != 4) {
				throw new Error("Invalid terrain: " + terrain);
			}
			var flag:uint = 0;
			if (t[0] == cid && t[1] == cid) {
				flag |= UP;
			}
			if (t[2] == cid && t[3] == cid) {
				flag |= DOWN;
			}
			if (t[0] == cid && t[2] == cid) {
				flag |= LEFT;
			}
			if (t[1] == cid && t[3] == cid) {
				flag |= RIGHT;
			}
			return flag;
		}
		
		private function applyCollision(data:Array, collisionFlagMap:Vector.<uint>):void {
			for (var y:uint = 0; y < data.length; y++) {
				for (var x:uint = 0; x < data[y].length; x++) {
					if (data[y][x] > 0) {
						collision.set(x, y, collisionFlagMap[data[y][x] - 1]);
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
