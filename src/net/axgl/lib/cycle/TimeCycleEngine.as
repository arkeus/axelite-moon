package net.axgl.lib.cycle {
	import org.axgl.Ax;
	import org.axgl.AxSprite;

	public class TimeCycleEngine extends AxSprite {
		public var time:Number;
		public var rate:Number;
		public var lightSequence:TimeCycleLightSequence;
		public var options:TimeCycleOptions;
		
		public function TimeCycleEngine(startTime:Number = 0, rate:Number = 1, lightSequence:TimeCycleLightSequence = null, options:TimeCycleOptions = null) {
			super(0, 0);
			
			this.time = startTime;
			this.rate = rate;
			this.lightSequence = lightSequence || new TimeCycleLightSequence;
			this.options = options || new TimeCycleOptions;
			
			noScroll();
			create(Ax.viewWidth, Ax.viewHeight, 0xffffffff);
		}
		
		override public function update():void {
			time += Ax.dt * rate;
			updateSprite();
			
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
			var adjustedTime:Number = hours + minutes / options.minutesPerHour;
			/*var adjustedTime:Number = (time - (options.hoursPerDay * 3 / 4)) % options.hoursPerDay;
			if (adjustedTime < 0) {
				adjustedTime += options.hoursPerDay;
			}*/
			trace(adjustedTime);
			trace("red");
			color.red = lightSequence.red.getIntensity(adjustedTime);
			trace("green");
			color.green = lightSequence.green.getIntensity(adjustedTime);
			trace("blue");
			color.blue = lightSequence.blue.getIntensity(adjustedTime);
			trace("alpha");
			color.alpha = lightSequence.alpha.getIntensity(adjustedTime);
		}
	}
}
