package net.axgl.lib.tiled {
	public class TiledImageLayer extends TiledLayer {
		public var image:TiledImage;

		public function TiledImageLayer(tmx:XML) {
			super(tmx);
			image = new TiledImage(tmx.image);
		}
	}
}