package net.axgl.moon.world {
	import net.axgl.moon.assets.Resource;
	
	import org.axgl.tilemap.AxTile;
	import org.axgl.tilemap.AxTilemap;

	public class CollisionMap extends AxTilemap {
		private var collision:Array;
		
		public function CollisionMap(cols:uint, rows:uint) {
			var row:Array = [], i:uint = 0;
			for (i = 0; i < cols; i++) {
				row[i] = 0;
			}
			collision = [];
			for (i = 0; i < rows; i++) {
				collision[i] = row.concat();
			}
		}
		
		public function set(x:uint, y:uint, flag:uint):void {
			collision[y][x] = flag;
		}
		
		public function apply(x:uint, y:uint, flag:uint):void {
			collision[y][x] |= flag;
		}
		
		public function initialize():void {
			build(collision, Resource.COLLISION_TILESET, Tile.SIZE, Tile.SIZE, 1);
			
			for (var i:uint = 1; i <= 16; i++) {
				trace(tiles[i].collision);
				tiles[i].collision = i;
				trace(ANY, i-1);
			}
		}
	}
}
