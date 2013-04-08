package net.axgl.lib.tiled {
	public class TiledImage {
		public var source:String;
		public var width:uint;
		public var height:uint;
		public var transparentColor:int;
		
		public function TiledImage(tmx:XMLList) {
			source = tmx.@source;
			width = tmx.@width;
			height = tmx.@height;
			transparentColor = "@trans" in tmx ? TiledUtils.colorStringToUint(tmx.@trans) : -1;
		}
	}
}
