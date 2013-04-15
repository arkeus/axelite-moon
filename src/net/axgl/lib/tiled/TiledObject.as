package net.axgl.lib.tiled {

	public class TiledObject {
		public var name:String;
		public var type:String;
		public var x:int;
		public var y:int;
		public var width:uint;
		public var height:uint;
		public var properties:TiledProperties;
		
		public function TiledObject(tmx:XML) {
			name = tmx.@name;
			type = tmx.@type;
			x = tmx.@x;
			y = tmx.@y;
			width = tmx.@width;
			height = tmx.@height;
			properties = new TiledProperties(tmx.properties);
		}
	}
}