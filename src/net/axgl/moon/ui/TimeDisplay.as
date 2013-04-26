package net.axgl.moon.ui {
	import net.axgl.lib.cycle.TimeCycleEngine;
	
	import org.axgl.AxGroup;
	import org.axgl.AxSprite;
	import org.axgl.text.AxText;

	public class TimeDisplay extends AxGroup {
		public static const WIDTH:uint = 36;
		public static const HEIGHT:uint = 13;
		public static const PADDING:uint = 2;
		
		private var cycle:TimeCycleEngine;
		private var background:AxSprite;
		private var display:AxText;
		
		public function TimeDisplay(x:uint, y:uint, cycle:TimeCycleEngine) {
			super(x, y);
			this.cycle = cycle;
			this.add(background = new AxSprite(0, 0));
			background.create(WIDTH, HEIGHT, 0x99000000);
			this.add(display = new AxText(PADDING, PADDING, null, "0:00", WIDTH - PADDING, "right"));
			noScroll();
		}
		
		override public function update():void {
			display.text = cycle.hours + ":" + (cycle.minutes < 10 ? "0" : "") + cycle.minutes;
			super.update();
		}
	}
}
