package net.axgl.moon.entity {
	import net.axgl.moon.assets.Resource;
	
	import org.axgl.Ax;
	import org.axgl.input.AxKey;

	public class Player extends Entity {
		private static const SPEED:uint = 24;
		
		public function Player(x:uint, y:uint) {
			super(x, y, Resource.PLAYER, 12, 24);
			
			addAnimation("walk_down", [0, 1, 0, 2], 12);
			addAnimation("walk_up", [4, 5, 4, 6], 12);
			addAnimation("walk_side", [8, 9, 8, 10], 12);
			
			addAnimation("stand_down", [0, 3], 2);
			addAnimation("stand_up", [4, 7], 2);
			addAnimation("stand_side", [8, 11], 2);
			
			width = 9;
			height = 7;
			offset.y = 17;
			offset.x = 1;
		}
		
		override public function update():void {
			handleInput();
			handleAnimation();
			super.update();
		}
		
		private function handleInput():void {
			if (Ax.keys.held(AxKey.A)) {
				velocity.x = -SPEED;
				facing = LEFT;
			} else if (Ax.keys.held(AxKey.D)) {
				velocity.x = SPEED;
				facing = RIGHT;
			} else {
				velocity.x = 0;
			}
			
			if (Ax.keys.held(AxKey.W)) {
				velocity.y = -SPEED;
				facing = UP;
			} else if (Ax.keys.held(AxKey.S)) {
				velocity.y = SPEED;
				facing = DOWN;
			} else {
				velocity.y = 0;
			}
			
			if (velocity.x != 0 && velocity.y != 0) {
				velocity.x *= 0.71;
				velocity.y *= 0.71;
			}
		}
		
		private function handleAnimation():void {
			var action:String = (velocity.x != 0 || velocity.y != 0) ? "walk" : "stand";
			var dir:String;
			switch (facing) {
				case UP: dir = "up"; break;
				case DOWN: dir = "down"; break;
				default: dir = "side"; break;
			}
			animate(action + "_" + dir);
		}
	}
}
