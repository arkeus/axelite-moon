package net.axgl.lib.tiled {
	public class TiledTile {
		public static const TOP_LEFT:uint = 0x0001;
		public static const TOP_RIGHT:uint = 0x0010;
		public static const BOTTOM_LEFT:uint = 0x0100;
		public static const BOTTOM_RIGHT:uint = 0x1000;
		public static const TOP:uint = TOP_LEFT | TOP_RIGHT;
		public static const LEFT:uint = BOTTOM_LEFT | TOP_LEFT;
		public static const RIGHT:uint = TOP_RIGHT | BOTTOM_RIGHT;
		public static const BOTTOM:uint = BOTTOM_LEFT | BOTTOM_RIGHT;
		
		private static const CORNER_MAP:Vector.<uint> = new <uint>[TOP_LEFT, TOP_RIGHT, BOTTOM_LEFT, BOTTOM_RIGHT];
		
		public var id:uint;
		public var terrain:uint;
		public var probability:Number;
		public var properties:TiledProperties;
		public var image:TiledImage;
		
		public function TiledTile(tmx:XML) {
			id = tmx.@id;
			terrain = csvToTerrain(tmx.@terrain);
			probability = "@probability" in tmx ? tmx.@probability : Number.NaN;
			properties = new TiledProperties(tmx.properties);
			image = new TiledImage(tmx.image);
		}
		
		private static function csvToTerrain(terrain:String):uint {
			var terrains:Array = terrain.split(","), value:uint = 0x0;
			for (var i:uint = 0; i < terrains.length; i++) {
				if (terrains[i].length > 0) {
					value += 0x1 << i;
				}
			}
			return value;
		}
	}
}
