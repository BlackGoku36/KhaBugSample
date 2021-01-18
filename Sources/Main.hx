package;

import kha.graphics4.CubeMap;
import kha.Image;
import haxe.Timer;
import kha.Assets;
import kha.Color;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;

class Main {

	static var map:CubeMap;
	static var mesh:Mesh;

	static function update(): Void {
	}

	static function render(frames: Array<Framebuffer>): Void {
		// As we are using only 1 window, grab the first framebuffer
		final g4 = frames[0].g4;
		final mapg4 = map.g4;
		for(i in 0...6){
			mapg4.beginFace(i);
			mesh.render(mapg4);
			mapg4.end();
		}
	}

	public static function main() {
		System.start({title: "Project", width: 1024, height: 768}, function (_) {
			map = CubeMap.createRenderTarget(1024, L8, Depth32Stencil8);
			mesh = new Mesh();
			// Just loading everything is ok for small projects
			Assets.loadEverything(function () {
				// Avoid passing update/render directly,
				// so replacing them via code injection works
				Scheduler.addTimeTask(function () { update(); }, 0, 1 / 60);
				System.notifyOnFrames(function (frames) { render(frames); });
			});
		});
	}
}
