package net.axgl.lib.tiled {
	/**
	 * Represents an image within a tiled map. The source is a string containing the path
	 * to the image relative to the location of the map.
	 */
	public class TiledImage {
		public var source:String;
		public var width:uint;
		public var height:uint;
		public var transparentColor:int;
		
		/**
		 * @param tmx The XMLList containing the <image> object.
		 */
		public function TiledImage(tmx:XMLList) {
			source = tmx.@source;
			width = tmx.@width;
			height = tmx.@height;
			transparentColor = "@trans" in tmx ? TiledUtils.colorStringToUint(tmx.@trans) : -1;
		}
	}
}
