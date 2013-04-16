package net.axgl.lib.tiled {

	public class TiledObject {
		public var name:String;
		public var type:String;
		public var gid:uint;
		public var x:int;
		public var y:int;
		public var width:uint;
		public var height:uint;
		public var properties:TiledProperties;
		
		public function TiledObject(tmx:XML) {
			name = "@name" in tmx ? tmx.@name : null;
			type = "@type" in tmx ? tmx.@type : null;
			gid = "@gid" in tmx ? tmx.@gid : 0;
			x = tmx.@x;
			y = tmx.@y;
			width = "@width" in tmx ? tmx.@width : 0;
			height = "@height" in tmx ? tmx.@height : 0;
			properties = new TiledProperties(tmx.properties);
		}
	}
}