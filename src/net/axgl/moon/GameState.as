package net.axgl.moon {
	import flash.utils.getTimer;
	
	import net.axgl.moon.assets.Resource;
	
	import org.axgl.Ax;
	import org.axgl.AxRect;
	import org.axgl.AxSprite;
	import org.axgl.AxState;
	import org.axgl.input.AxKey;
	import org.axgl.input.AxMouseButton;
	import org.axgl.text.AxText;
	import org.axgl.util.debug.AxDebugConsole;

	public class GameState extends AxState {
		override public function create():void {
			this.add(new AxText(50, 50, null, "Empty Project"));
			//Ax.logger.info("one");
			Ax.logger.warn("one");
			Ax.logger.error("one");
			
			for (var x:uint = 0; x < Ax.width; x += 12) {
				this.add(new AxSprite(x, x * 2, Resource.PLAYER, 12, 24));
			}
			
			Ax.camera.bounds = new AxRect(0, 0, Ax.viewWidth - 10, Ax.viewHeight - 10);
		}
		
		override public function update():void {			
			super.update();
		}
	}
}
