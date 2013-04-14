package net.axgl.moon.entity {
	import org.axgl.AxSprite;

	public class Entity extends AxSprite {
		public function Entity(x:Number = 0, y:Number = 0, graphic:Class = null, frameWidth:uint = 0, frameHeight:uint = 0) {
			super(x, y, graphic, frameWidth, frameHeight);
		}
	}
}
