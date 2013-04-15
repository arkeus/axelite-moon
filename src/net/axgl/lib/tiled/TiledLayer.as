package net.axgl.lib.tiled {
	public class TiledLayer {
		public var name:String;
		public var width:uint;
		public var height:uint;
		public var opacity:Number;
		public var visible:Boolean;
		public var properties:TiledProperties;
		
		public function TiledLayer(tmx:XML) {
			name = tmx.@name;
			width = tmx.@width;
			height = tmx.@height;
			opacity = "@opacity" in tmx ? tmx.@opacity : 1.0;
			visible = !("@visible" in tmx && tmx.@visible == "0");
			properties = new TiledProperties(tmx.properties);
		}
	}
}
