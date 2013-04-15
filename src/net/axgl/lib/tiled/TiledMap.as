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
		public var layers:TiledLayers;
		
		public function TiledMap(tmx:XML) {
			version = "@version" in tmx ? tmx.@version : "?";
			orientation = "@orientation" in tmx ? tmx.@orientation : "othogonal";
			width = tmx.@width;
			height = tmx.@height;
			tileWidth = tmx.@tilewidth;
			tileHeight = tmx.@tileheight;
			backgroundColor = "@backgroundcolor" in tmx ? TiledUtils.colorStringToUint(tmx.@backgroundcolor) : 0xffffff;
			properties = new TiledProperties(tmx.properties);
			tilesets = new TiledTilesets(tmx.tileset);
			parseLayers(tmx);
		}
		
		private function parseLayers(tmx:XML):void {
			layers = new TiledLayers;
			
			// Parse all children, since for some reason layer and objectgroup aren't grouped easily, even though the ordering
			// between them can be very important
			var elements:XMLList = tmx.children();
			for (var i:uint = 0; i < elements.length(); i++) {
				var name:QName = (elements[i] as XML).name();
				if (name.localName == "layer") {
					layers.addLayer(new TiledTileLayer(elements[i]));
				} else if (name.localName == "objectgroup") {
					layers.addLayer(new TiledObjectLayer(elements[i]));
				}
			}
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
				"Tilesets: " + tilesets,
				"Layers: " + layers,
			].join(", ");
		}
	}
}
