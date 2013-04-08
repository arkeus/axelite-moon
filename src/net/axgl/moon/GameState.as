package net.axgl.moon {
	import flash.utils.getTimer;
	
	import net.axgl.lib.tiled.TiledReader;
	import net.axgl.moon.assets.Map;
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
			trace(new TiledReader().loadFromEmbedded(Map.WORLD));
		}
		
		override public function update():void {
			super.update();
		}
	}
}
