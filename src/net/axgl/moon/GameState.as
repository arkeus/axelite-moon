package net.axgl.moon {
	import org.axgl.AxState;
	import org.axgl.text.AxText;

	public class GameState extends AxState {
		override public function create():void {
			this.add(new AxText(50, 50, null, "Empty Project"));
		}
	}
}
