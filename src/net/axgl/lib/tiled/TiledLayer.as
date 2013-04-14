package net.axgl.lib.tiled {
	public class TiledLayer {
		public var name:String;
		public var width:uint;
		public var height:uint;
		public var opacity:Number;
		public var visible:Boolean;
		
		public var encoding:String;
		public var compression:String;
		public var data:Array;
		
		public function TiledLayer(tmx:XML) {
			name = tmx.@name;
			width = tmx.@width;
			height = tmx.@height;
			opacity = "@opacity" in tmx ? tmx.@opacity : 1.0;
			visible = !("@visible" in tmx && tmx.@visible == "0");
			
			var dataNode:XML = tmx.data[0];
			encoding = "@encoding" in dataNode ? dataNode.@encoding : null;
			compression = "@compression" in dataNode ? dataNode.@compression : null;
			data = TiledUtils.stringToTileData(dataNode.text(), width, encoding, compression);
			
		}
	}
}
