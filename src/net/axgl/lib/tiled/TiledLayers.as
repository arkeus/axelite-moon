package net.axgl.lib.tiled {
	public class TiledLayers {
		public var layers:Vector.<TiledLayer>;
		
		public function TiledLayers() {
			layers = new Vector.<TiledLayer>;
		}
		
		public function addLayer(layer:TiledLayer):void {
			layers.push(layer);
		}
		
		public function getAllLayers():Vector.<TiledLayer> {
			return layers;
		}
		
		public function getVisibleLayers():Vector.<TiledLayer> {
			return layers.filter(function(el:TiledLayer, i:int, arr:Vector.<TiledLayer>):Boolean { return el.visible; });
		}
		
		public function getTileLayers():Vector.<TiledLayer> {
			return layers.filter(function(el:TiledLayer, i:int, arr:Vector.<TiledLayer>):Boolean { return el is TiledTileLayer; });
		}
		
		public function get length():uint {
			return layers.length;
		}
		
		public function toString():String {
			return length + " layers";
		}
	}
}
