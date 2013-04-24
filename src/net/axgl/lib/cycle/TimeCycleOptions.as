package net.axgl.lib.cycle {
	public class TimeCycleOptions {
		internal var secondsPerMinute:Number;
		internal var minutesPerHour:Number;
		internal var hoursPerDay:Number;
		internal var daysPerMonth:Number;
		internal var monthsPerYear:Number;
		
		internal var secondsPerHour:Number;
		internal var secondsPerDay:Number;
		internal var secondsPerMonth:Number;
		internal var secondsPerYear:Number;
		
		public function TimeCycleOptions() {
			alterTimeValues(60, 60, 24, 30, 12);
			calculateSecondValues();
		}
		
		public function alterTimeValues(secondsPerMinute:Number, minutesPerHour:Number, hoursPerDay:Number, daysPerMonth:Number, monthsPerYear:Number):void {
			this.secondsPerMinute = secondsPerMinute;
			this.minutesPerHour = minutesPerHour;
			this.hoursPerDay = hoursPerDay;
			this.daysPerMonth = daysPerMonth;
			this.monthsPerYear = monthsPerYear;
			calculateSecondValues();
		}
		
		private function calculateSecondValues():void {
			secondsPerHour = secondsPerMinute * minutesPerHour;
			secondsPerDay = secondsPerHour * hoursPerDay;
			secondsPerMonth = secondsPerDay * daysPerMonth;
			secondsPerYear = secondsPerMonth * monthsPerYear;
		}
	}
}
