package net.axgl.lib.tiled {
	/**
	 * Reader for loading Tiled 0.9.0 maps.
	 */
	public class TiledReader {
		public function TiledReader() {
		}
		
		public function loadFromEmbedded(map:Class):TiledMap {
			return loadFromXML(new XML(new map));
		}
		
		public function loadFromXML(map:XML):TiledMap {
			return new TiledMap(map);
		}
	}
}
