package net.axgl.lib.tiled {

	public class TiledObjectLayer extends TiledLayer {
		public function TiledObjectLayer(tmx:XML) {
			super(tmx);
			
			// TODO: do objecty stuff
			// Each entry in objectgroup is an object (probably, except for shit like properties)
			// name, type, gid (if its a tile entry), width, height
			// each object can have properties
		}
	}
}
