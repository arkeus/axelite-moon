package net.axgl.lib.cycle {
	public class TimeCycleLightSequence {
		public var red:TimeCycleLightCurve;
		public var green:TimeCycleLightCurve;
		public var blue:TimeCycleLightCurve;
		public var alpha:TimeCycleLightCurve;
		
		public function TimeCycleLightSequence(red:Array = null, green:Array = null, blue:Array = null, alpha:Array = null) {
			this.red = new TimeCycleLightCurve(red);
			this.green = new TimeCycleLightCurve(green);
			this.blue = new TimeCycleLightCurve(blue);
			this.alpha = new TimeCycleLightCurve(alpha);
		}
	}
}
