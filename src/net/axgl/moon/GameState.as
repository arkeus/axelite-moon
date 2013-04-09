package net.axgl.moon {
	import flash.utils.getTimer;
	
	import net.axgl.lib.tiled.TiledLayer;
	import net.axgl.lib.tiled.TiledMap;
	import net.axgl.lib.tiled.TiledReader;
	import net.axgl.moon.assets.Map;
	import net.axgl.moon.assets.Resource;
	import net.axgl.moon.entity.Player;
	
	import org.axgl.Ax;
	import org.axgl.AxRect;
	import org.axgl.AxSprite;
	import org.axgl.AxState;
	import org.axgl.input.AxKey;
	import org.axgl.input.AxMouseButton;
	import org.axgl.render.AxColor;
	import org.axgl.text.AxText;
	import org.axgl.tilemap.AxTilemap;
	import org.axgl.util.debug.AxDebugConsole;

	public class GameState extends AxState {
		private var player:Player;
		
		override public function create():void {
			var map:TiledMap = new TiledReader().loadFromEmbedded(Map.WORLD);
			for each(var layer:TiledLayer in map.layers.getVisibleLayers()) {
				var tilemap:AxTilemap = new AxTilemap;
				tilemap.build(layer.data, Resource.TILESET, map.tileWidth, map.tileHeight, 0);
				this.add(tilemap);
			}
			Ax.background = AxColor.fromHex(map.backgroundColor);
			
			this.add(player = new Player(300, 300));
			Ax.camera.follow(player);
		}
		
		override public function update():void {super.update();
		}
	}
}
