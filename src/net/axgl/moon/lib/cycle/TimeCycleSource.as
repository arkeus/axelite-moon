package net.axgl.moon.lib.cycle {
	import net.axgl.lib.cycle.TimeCycleLightSequence;
	
	import org.axgl.render.AxColor;

	public class TimeCycleSource {
		private static const LIGHT_SEQUENCE_SOURCE:Object = {
			0: new AxColor(0, 0, 0, 0.5), // TODO: Fix this wraparound bug
			6: new AxColor(0, 0, 0, 0.5),
			8: new AxColor(0.5, 0.5, 0, 0.3),
			10: new AxColor(0.8, 0.8, 0, 0.15),
			12: new AxColor(1, 1, 0, 0),
			18: new AxColor(0, 0, 0, 0),
			22: new AxColor(0, 0, 0, 0.5)
		};
		
		public function generateLightSequence():TimeCycleLightSequence {
			var sequence:TimeCycleLightSequence = new TimeCycleLightSequence;
			
			for (var hourString:String in LIGHT_SEQUENCE_SOURCE) {
				var hour:int = parseInt(hourString);
				var color:AxColor = LIGHT_SEQUENCE_SOURCE[hourString] as AxColor;
				sequence.red.add(hour, color.red);
				sequence.green.add(hour, color.green);
				sequence.blue.add(hour, color.blue);
				sequence.alpha.add(hour, color.alpha);
			}
			
			return sequence;
		}
	}
}
