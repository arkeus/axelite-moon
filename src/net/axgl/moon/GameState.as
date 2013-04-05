package net.axgl.moon {
	import flash.utils.getTimer;
	
	import org.axgl.Ax;
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
		}
		
		override public function update():void {
			if (Ax.mouse.held(AxMouseButton.LEFT)) {
				Ax.logger.info(getTimer() + " l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l l ");
			}
				
			if (Ax.keys.pressed(AxKey.ONE)) {
				Ax.debugger.console.reflow(AxDebugConsole.BOTTOM_LEFT_LAYOUT);
			}
			if (Ax.keys.pressed(AxKey.TWO)) {
				Ax.debugger.console.reflow(AxDebugConsole.LEFT_SIDE_LAYOUT);
			}
			if (Ax.keys.pressed(AxKey.THREE)) {
				Ax.debugger.console.reflow(AxDebugConsole.FULL_SCREEN_LAYOUT);
			}
			
			super.update();
		}
	}
}
