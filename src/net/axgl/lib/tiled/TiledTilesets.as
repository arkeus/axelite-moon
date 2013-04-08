package net.axgl.lib.tiled {
	public class TiledTilesets {
		public var tilesets:Object = {};
		
		public function TiledTilesets(tmx:XMLList) {
			for (var i:uint = 0; i < tmx.length(); i++) {
				addTileset(tmx[i]);
			}
		}
		
		private function addTileset(tmx:XML):void {
			var tileset:TiledTileset = new TiledTileset(tmx);
			tilesets[tileset.name] = tileset;
		}
	}
}
