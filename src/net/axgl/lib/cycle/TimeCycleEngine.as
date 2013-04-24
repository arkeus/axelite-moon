package net.axgl.lib.cycle {
	import org.axgl.Ax;
	import org.axgl.AxSprite;

	public class TimeCycleEngine extends AxSprite {
		public var time:Number;
		public var rate:Number;
		public var options:TimeCycleOptions;
		
		public function TimeCycleEngine(startTime:Number = 0, rate:Number = 1, options:TimeCycleOptions = null) {
			super(0, 0);
			
			this.time = startTime;
			this.rate = rate;
			this.options = options || new TimeCycleOptions;
			
			scroll.x = scroll.y = 0;
			create(Ax.viewWidth, Ax.viewHeight, 0xffffffff);
		}
		
		override public function update():void {
			time += Ax.dt * rate;
			updateSprite();
			
			trace(hours, minutes, seconds);
			
			super.update();
		}
		
		public function get seconds():uint {
			return Math.floor(time) % 60;
		}
		
		public function get minutes():uint {
			return Math.floor(time / options.secondsPerMinute) % options.minutesPerHour;
		}
		
		public function get hours():uint {
			return Math.floor(time / options.secondsPerHour) % options.hoursPerDay;
		}
		
		public function get days():uint {
			return Math.floor(time / options.secondsPerDay) % options.daysPerMonth;
		}
		
		public function get months():uint {
			return Math.floor(time / options.secondsPerMonth) % options.monthsPerYear;
		}
		
		public function get years():uint {
			return Math.floor(time / options.secondsPerYear);
		}
		
		private function updateSprite():void {
			var time:Number = hours + minutes / options.minutesPerHour;
			var adjustedTime:Number = (time - (options.hoursPerDay * 3 / 4)) % options.hoursPerDay;
			if (adjustedTime < 0) {
				adjustedTime += options.hoursPerDay;
			}
			
			alpha = 0;
			if (adjustedTime < 4) {
				alpha = adjustedTime / 4;
				color.red = color.green = 0;
				color.blue = 0.1;
			} else if (adjustedTime < 14) {
				alpha = 1;
				color.red = color.green = 0;
				color.blue = 0.1;
			} else if (adjustedTime < 16) {
				alpha = 1 - ((adjustedTime - 14) / 2);
				color.red = color.green = ((adjustedTime - 14) / 2);
				color.blue = (1 - color.red) / 4;
			}
			alpha *= 0.6;
			trace(alpha, adjustedTime, time);
		}
	}
}
