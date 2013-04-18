package net.axgl.lib.tiled {

	public class TiledObjectLayer extends TiledLayer {
		public var objects:Vector.<TiledObject>;
		public var typeMap:Object;
		public var nameMap:Object;
		
		public function TiledObjectLayer(tmx:XML) {
			super(tmx);
			
			objects = new Vector.<TiledObject>;
			typeMap = {};
			nameMap = {};
			
			var objectList:XMLList = tmx.object;
			for (var i:uint = 0; i < objectList.length(); i++) {
				var object:TiledObject = new TiledObject(objectList[i]);
				objects.push(object);
				if (object.name) {
					nameMap[object.name] = object;
				}
				if (object.type) {
					(typeMap[object.type] ||= new Vector.<TiledObject>).push(object);
				}
			}
		}
		
		public function getObjectByIndex(index:uint):TiledObject {
			return objects[index];
		}
		
		public function getObjectByName(name:String):TiledObject {
			return nameMap[name];
		}
		
		public function getObjectsByType(type:String):Vector.<TiledObject> {
			return typeMap[type];
		}
	}
}
