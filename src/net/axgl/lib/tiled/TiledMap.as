package net.axgl.lib.tiled {
	public class TiledMap {
		public var version:String;
		public var orientation:String;
		public var width:uint;
		public var height:uint;
		public var tileWidth:uint;
		public var tileHeight:uint;
		public var backgroundColor:uint;
		public var properties:TiledProperties;
		public var tilesets:TiledTilesets;
		
		public function TiledMap(tmx:XML) {
			version = "@version" in tmx ? tmx.@version : "?";
			orientation = "@orientation" in tmx ? tmx.@orientation : "othogonal";
			width = tmx.@width;
			height = tmx.@height;
			tileWidth = tmx.@tileWidth;
			tileHeight = tmx.@tileHeight;
			backgroundColor = "@backgroundcolor" in tmx ? TiledUtils.colorStringToUint(tmx.@backgroundcolor) : 0xffffff;
			properties = new TiledProperties(tmx.properties);
			tilesets = new TiledTilesets(tmx.tileset);
		}
		
		/**
		 * Converts the map to a string containing the main properties for debugging purposes.
		 * 
		 * @return The map in string format.
		 */
		public function toString():String {
			return [
				"Version: " + version,
				"Orientation: " + orientation,
				"Width: " + width,
				"Height: " + height,
				"TileWidth: " + tileWidth,
				"TileHeight: " + tileHeight,
				"BackgroundColor: " + backgroundColor,
				"Properties: " + properties,
				"Tilesets: " + tilesets
			].join(", ");
		}
	}
}
