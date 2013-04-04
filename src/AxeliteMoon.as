package {
	import net.axgl.moon.GameState;
	
	import org.axgl.Ax;
	
	[SWF(width = "800", height = "600", backgroundColor = "#000000")]

	public class AxeliteMoon extends Ax {
		public function AxeliteMoon() {
			super(GameState, 800, 600, 2);
		}
		
		override public function create():void {
			Ax.debuggerEnabled = true;
		}
	}
}
