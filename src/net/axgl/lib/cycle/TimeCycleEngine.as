package net.axgl.lib.cycle {
	import org.axgl.Ax;
	import org.axgl.AxSprite;

	public class TimeCycleEngine extends AxSprite {
		public var secondsPerMinute:Number = 60;
		public var minutesPerHour:Number = 60;
		public var hoursPerDay:Number = 24;
		public var daysPerMonth:Number = 30;
		public var monthsPerYear:Number = 12;
		
		public var rate:Number;
		public var time:Number;
		
		public function TimeCycleEngine(startTime:Number = 0, rate:Number = 1) {
			super(0, 0);
			this.time = startTime;
			this.rate = rate;
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
			return Math.floor(time / secondsPerMinute) % minutesPerHour;
		}
		
		public function get hours():uint {
			return Math.floor(time / secondsPerMinute / minutesPerHour) % hoursPerDay;
		}
		
		public function get days():uint {
			return Math.floor(time / secondsPerMinute / minutesPerHour / hoursPerDay) % daysPerMonth;
		}
		
		public function get months():uint {
			return Math.floor(time / secondsPerMinute / minutesPerHour / hoursPerDay / daysPerMonth) % monthsPerYear;
		}
		
		public function get years():uint {
			return Math.floor(time / secondsPerMinute / minutesPerHour / hoursPerDay / daysPerMonth / monthsPerYear);
		}
		
		private function updateSprite():void {
			var time:Number = hours + minutes / minutesPerHour;
			var adjustedTime:Number = (time - (hoursPerDay * 3 / 4)) % hoursPerDay;
			if (adjustedTime < 0) {
				adjustedTime += hoursPerDay;
			}
			
			alpha = 0;
			if (adjustedTime < 4) {
				alpha = adjustedTime / 4;
				color.red = color.green = 0;
				color.blue = 0.25;
			} else if (adjustedTime < 14) {
				alpha = 1;
				color.red = color.green = 0;
				color.blue = 0.25;
			} else if (adjustedTime < 16) {
				alpha = 1 - ((adjustedTime - 14) / 2);
				color.red = color.green = ((adjustedTime - 14) / 2);
				color.blue = (1 - color.red) / 4;
			}
			alpha *= 0.5;
			trace(alpha, adjustedTime, time);
		}
	}
}
