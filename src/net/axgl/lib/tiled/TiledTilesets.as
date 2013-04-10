package net.axgl.lib.tiled {
	public class TiledTilesets {
		public var tilesets:Object = {};
		public var tilesetsVector:Vector.<TiledTileset> = new <TiledTileset>[];
		
		public function TiledTilesets(tmx:XMLList) {
			for (var i:uint = 0; i < tmx.length(); i++) {
				addTileset(tmx[i]);
			}
		}
		
		private function addTileset(tmx:XML):void {
			var tileset:TiledTileset = new TiledTileset(tmx);
			tilesets[tileset.name] = tileset;
			tilesetsVector.push(tileset);
		}
		
		public function getTileset(index:uint):TiledTileset {
			return tilesetsVector[index];
		}
		
		public function getTilesetByName(name:String):TiledTileset {
			return tilesets[name];
		}
		
		public function size():uint {
			return tilesetsVector.length;
		}
		
		public function toString():String {
			return size() + " tilesets";
		}
	}
}
