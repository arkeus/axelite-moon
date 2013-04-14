package net.axgl.lib.tiled {
	import flash.geom.Point;

	public class TiledTileset {
		public var firstGid:uint;
		public var name:String;
		public var tileWidth:uint;
		public var tileHeight:uint;
		public var spacing:uint;
		public var margin:uint;
		public var tileOffset:Point;
		
		public var properties:TiledProperties;
		public var image:TiledImage;
		public var terrain:Object;
		public var tiles:Object;
		
		public function TiledTileset(tmx:XML) {
			firstGid = tmx.@firstgid;
			name = tmx.@name;
			tileWidth = tmx.@tileWidth;
			tileHeight = tmx.@tileHeight;
			spacing = "@spacing" in tmx ? tmx.@spacing : 0;
			margin = "@margin" in tmx ? tmx.@margin : 0;
			
			var offset:XMLList = tmx.tileoffset;
			tileOffset = offset.length() == 1 ? new Point(offset.@x, offset.@y) : new Point;
			
			image = new TiledImage(tmx.image);
			terrain = loadTerrain(tmx.terraintypes);
			tiles = loadTiles(tmx.tile);
		}
		
		private static function loadTerrain(tmx:XMLList):Object {
			var terrain:Object = {};
			
			for (var i:uint = 0; i < tmx.terrain.length(); i++) {
				var node:TiledTerrain = new TiledTerrain(tmx.terrain[i]);
				terrain[node.name] = node;
			}
			
			return terrain;
		}
		
		private static function loadTiles(tmx:XMLList):Object {
			var tiles:Object = {};
			
			for (var i:uint = 0; i < tmx.length(); i++) {
				var node:TiledTile = new TiledTile(tmx[i]);
				tiles[node.id] = node;
			}
			
			return tiles;
		}
	}
}
