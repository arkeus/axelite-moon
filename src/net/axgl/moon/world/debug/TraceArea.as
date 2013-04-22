package net.axgl.moon.world.debug {
	import io.arkeus.tiled.TiledObject;
	
	import net.axgl.moon.assets.Registry;
	
	import org.axgl.Ax;
	import org.axgl.AxEntity;

	public class TraceArea extends AxEntity {
		private var message:String;
		
		public function TraceArea(object:TiledObject) {
			super(object.x, object.y);
			width = object.width;
			height = object.height;
			message = object.properties.get("text");
		}
		
		override public function update():void {
			if (Registry.player.overlaps(this)) {
				Ax.logger.info("Inside Trace Area: " + message);
			}
			super.update();
		}
	}
}
