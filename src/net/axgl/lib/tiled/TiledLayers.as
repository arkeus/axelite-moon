package net.axgl.lib.tiled {
	public class TiledLayers {
		public var layers:Vector.<TiledLayer>;
		
		public function TiledLayers(tmx:XMLList) {
			layers = new Vector.<TiledLayer>;
			for (var i:uint = tmx.length() - 1; i > -1; i--) {
				addLayer(tmx[i]);
			}
		}
		
		private function addLayer(tmx:XML):void {
			layers.push(new TiledLayer(tmx));
		}
	}
}
