package net.axgl.lib.tiled {
	public class TiledTileLayer extends TiledLayer {
		public var encoding:String;
		public var compression:String;
		public var data:Array;

		public function TiledTileLayer(tmx:XML) {
			super(tmx);
			
			var dataNode:XML = tmx.data[0];
			encoding = "@encoding" in dataNode ? dataNode.@encoding : null;
			compression = "@compression" in dataNode ? dataNode.@compression : null;
			data = TiledUtils.stringToTileData(dataNode.text(), width, encoding, compression);
		}
	}
}
