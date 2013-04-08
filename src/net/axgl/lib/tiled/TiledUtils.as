package net.axgl.lib.tiled {
	public class TiledUtils {
		/**
		 * Converts a string in the format "#rrggbb" or "rrggbb" to the corresponding
		 * uint representation.
		 * 
		 * @param color The color in string format.
		 * @return The color in uint format.
		 */
		public static function colorStringToUint(color:String):uint {
			return uint("0x" + color.replace("#", ""));
		}
	}
}
