package net.axgl.moon.world {
	import io.arkeus.tiled.TiledObject;
	
	import net.axgl.moon.entity.Player;

	public class ObjectHandler {
		private var objects:Vector.<TiledObject>;
		
		public function ObjectHandler(objects:Vector.<TiledObject>) {
			this.objects = objects;
		}
		
		public function build(world:World):void {
			for each(var object:TiledObject in objects) {
				parseObject(world, object);
			}
		}
		
		private function parseObject(world:World, object:TiledObject):void {
			switch (object.type) {
				case "player_spawn":
					world.add(world.player = new Player(object.x, object.y));
				break;
			}
		}
	}
}
