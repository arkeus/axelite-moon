package net.axgl.lib.tiled {
	public class TiledProperties {
		public var properties:Object = {};
		
		public function TiledProperties(properties:XMLList) {
			for (var i:uint = 0; i < properties.property.length(); i++) {
				set(properties.property[i].@name, properties.property[i].@value);
			}
		}
		
		public function get(key:String):String {
			return properties[key];
		}
		
		public function set(key:String, value:String):void {
			properties[key] = value;
		}
		
		public function toString():String {
			var props:Vector.<String> = new <String>[];
			for (var key:String in properties) {
				props.push(key + "=" + properties[key]);
			}
			return "(" + props.join(", ") + ")";
		}
	}
}
