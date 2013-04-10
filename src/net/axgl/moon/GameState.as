package net.axgl.moon {
	import flash.utils.getTimer;
	
	import net.axgl.lib.tiled.TiledLayer;
	import net.axgl.lib.tiled.TiledMap;
	import net.axgl.lib.tiled.TiledReader;
	import net.axgl.moon.assets.Map;
	import net.axgl.moon.assets.Resource;
	import net.axgl.moon.entity.Player;
	import net.axgl.moon.world.World;
	
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
		private var world:World;
		
		override public function create():void {
			var map:TiledMap = new TiledReader().loadFromEmbedded(Map.WORLD);
			this.add(world = new World().build(map));
			this.add(player = new Player(300, 300));
			Ax.camera.follow(player);
		}
		
		override public function update():void {
			if (Ax.keys.pressed(AxKey.SPACE)) {
				world.collision.setGraphic(Resource.COLLISION_TILESET_RED);
			}
			
			super.update();
			
			Ax.collide(player, world.collision);
		}
	}
}
