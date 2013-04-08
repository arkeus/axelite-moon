package net.axgl.lib.tiled {
	public class TiledLayers {
		public var layers:Vector.<TiledLayer>;
		
		public function TiledLayers(tmx:XMLList) {
			layers = new Vector.<TiledLayer>;
			for (var i:uint = 0; i < tmx.length(); i++) {
				addLayer(tmx[i]);
			}
		}
		
		private function addLayer(tmx:XML):void {
			layers.push(new TiledLayer(tmx));
		}
		
		public function getAllLayers():Vector.<TiledLayer> {
			return layers;
		}
		
		public function getVisibleLayers():Vector.<TiledLayer> {
			return layers.filter(function(el:TiledLayer, i:int, arr:Vector.<TiledLayer>):Boolean { return el.visible; });
		}
		
		public function get length():uint {
			return layers.length;
		}
		
		public function toString():String {
			return length + " layers";
		}
	}
}
