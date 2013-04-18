package net.axgl.lib.tiled {
	import flash.geom.Point;

	public class TiledObject {
		public static const RECTANGLE:uint = 0;
		public static const ELLIPSE:uint = 1;
		public static const POLYGON:uint = 2;
		public static const POLYLINE:uint = 3;
		
		public var name:String;
		public var type:String;
		public var gid:uint;
		public var x:int;
		public var y:int;
		public var width:uint;
		public var height:uint;
		public var properties:TiledProperties;
		public var shape:uint;
		public var points:Vector.<Point>;
		
		public function TiledObject(tmx:XML) {
			name = "@name" in tmx ? tmx.@name : null;
			type = "@type" in tmx ? tmx.@type : null;
			gid = "@gid" in tmx ? tmx.@gid : 0;
			x = tmx.@x;
			y = tmx.@y;
			width = "@width" in tmx ? tmx.@width : 0;
			height = "@height" in tmx ? tmx.@height : 0;
			properties = new TiledProperties(tmx.properties);
			shape = RECTANGLE;
			
			if (tmx.ellipse.length() > 0) {
				shape = ELLIPSE;
			} else if (tmx.polygon.length() > 0) {
				shape = POLYGON;
				populatePoints(tmx.polygon.@points);
			} else if (tmx.polyline.length() > 0) {
				shape = POLYLINE;
				populatePoints(tmx.polyline.@points);
			}
		}
		
		private function populatePoints(pointString:String):void {
			points = new Vector.<Point>;
			var pointArray:Array = pointString.split(" ");
			for (var i:uint = 0; i < pointArray.length; i++) {
				var ps:Array = pointArray[i].split(",");
				if (ps.length != 2) {
					throw new ArgumentError("Invalid poly point: " + pointArray[i]);
				}
				points.push(new Point(parseFloat(ps[0]), parseFloat(ps[1])));
			}
		}
	}
}