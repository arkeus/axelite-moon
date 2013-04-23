package {
	import net.axgl.moon.GameState;
	
	import org.axgl.Ax;
	import org.axgl.render.AxColor;
	import org.axgl.util.debug.AxDebugConsole;
	
	[SWF(width = "800", height = "600", backgroundColor = "#000000")]

	public class AxeliteMoon extends Ax {
		public function AxeliteMoon() {
			super(GameState, 800, 600, 2);
		}
		
		override public function create():void {
			Ax.debuggerEnabled = true;
			Ax.debugger.console.reflow(AxDebugConsole.BOTTOM_LEFT_LAYOUT);
			Ax.debugger.active = true;
		}
	}
}
