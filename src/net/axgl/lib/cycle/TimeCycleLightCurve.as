package net.axgl.lib.cycle {
	public class TimeCycleLightCurve {
		public var points:Vector.<TimeCycleLightPoint>;
		public var defaultValue:Number;
		
		private var temp:TimeCycleLightPoint;
		
		public function TimeCycleLightCurve(points:Array = null, defaultValue:Number = 0) {
			this.points = new Vector.<TimeCycleLightPoint>;
			this.defaultValue = defaultValue;
			this.temp = new TimeCycleLightPoint;
			
			if (points != null) {
				for (var i:uint = 0; i < points.length; i++) {
					if (points[i].length != 2) {
						throw new ArgumentError("Invalid point in light curve initialization:", points[i]);
					}
					this.points.push(new TimeCycleLightPoint(points[i][0], points[i][1]));
				}
			
			}
			sort();
		}
		
		public function add(hour:Number, intensity:Number):TimeCycleLightCurve {
			points.push(new TimeCycleLightPoint(hour, intensity));
			sort();
			return this;
		}
		
		public function getIntensity(hour:Number):Number {
			for (var i:uint = 0; i < points.length; i++) {
				if (i < points.length - 1 && points[i].hour < hour && points[i + 1].hour < hour) {
					continue;
				}
				
				var left:TimeCycleLightPoint = points[i];
				var right:TimeCycleLightPoint;
				if (i == points.length - 1) {
					right = temp;
					right.hour = left.hour + points[0].hour;
					right.intensity = points[0].intensity;
				} else if (i == 0 && left.hour != 0) {
					right = points[i + 1];
					left = temp;
					left.hour = points[points.length - 1].hour - 24;
					left.intensity = points[points.length - 1].intensity;
				} else {
					right = points[i + 1];
				}
				
				trace("GET INTENSITY");
				trace(hour, left.hour, left.intensity, right.hour, right.intensity);
				if (left.hour == right.hour) {
					trace(left.intensity);
					return left.intensity;
				}
				trace(left.intensity + (right.intensity - left.intensity) * ((hour - left.hour) / (right.hour - left.hour)));
				return left.intensity + (right.intensity - left.intensity) * ((hour - left.hour) / (right.hour - left.hour));
			}
			
			return defaultValue;
		}
		
		private function sort():void {
			points.sort(function(tclp1:TimeCycleLightPoint, tclp2:TimeCycleLightPoint):Number {
				return tclp1.hour - tclp2.hour;
			});
		}
	}
}
