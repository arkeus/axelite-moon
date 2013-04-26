package net.axgl.moon {
	import io.arkeus.tiled.TiledMap;
	import io.arkeus.tiled.TiledReader;
	
	import net.axgl.lib.cycle.TimeCycleEngine;
	import net.axgl.lib.cycle.TimeCycleLightCurve;
	import net.axgl.lib.cycle.TimeCycleLightSequence;
	import net.axgl.moon.assets.Map;
	import net.axgl.moon.assets.Registry;
	import net.axgl.moon.assets.Resource;
	import net.axgl.moon.ui.TimeDisplay;
	import net.axgl.moon.world.World;
	
	import org.axgl.Ax;
	import org.axgl.AxSprite;
	import org.axgl.AxState;
	import org.axgl.input.AxKey;

	public class GameState extends AxState {
		private var world:World;
		private var timeDisplay:TimeDisplay;
		
		private static var blah:Array = [];
		
		private var cow:GameState;
		
		override public function create():void {
			var map:TiledMap = new TiledReader().loadFromEmbedded(Map.WORLD);
			this.add(world = new World().build(map));
			Ax.camera.follow(world.player);
			Ax.background.hex = 0xffffffff;
			
			Registry.game = this;
			Registry.player = world.player;
			
			var cycle:TimeCycleEngine = new TimeCycleEngine(0, 3600, new TimeCycleLightSequence(
				[[0,0], [6,0], [10,1], [18, 0]],
				null,
				[[6,1], [8, 0], [18, 0], [22, 1]],
				[[9, 0.5], [10, 0], [18, 0], [20, 0.5]]
			));
			this.add(cycle);
			this.add(timeDisplay = new TimeDisplay(4, Ax.viewHeight - TimeDisplay.HEIGHT - 2, cycle));
			
			var c:TimeCycleLightCurve = new TimeCycleLightCurve([[9, 0.5]]);
			trace(c.getIntensity(5), c.getIntensity(9), c.getIntensity(20));
		}
		
		override public function update():void {
			if (Ax.keys.pressed(AxKey.SPACE)) {
				world.collision.setGraphic(Resource.COLLISION_TILESET_RED);
			}
			
			super.update();
			
			Ax.collide(world.player, world.collision);
		}
	}
}
