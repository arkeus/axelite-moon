package net.axgl.lib.tiled {
	public class TiledTerrain {
		public var name:String;
		public var tile:int;
		public var properties:TiledProperties;
		
		public function TiledTerrain(terrain:XML) {
			name = terrain.@name;
			tile = terrain.@tile;
			properties = new TiledProperties(terrain.properties);
		}
	}
}
