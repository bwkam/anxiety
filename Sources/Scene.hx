package;

import graphics.shapes.Triangle;
import graphics.shapes.Rect;
import kha.Scheduler;
import kha.System;
import kha.Framebuffer;
import kha.Assets;

class Scene {
	public var sprite:Rect;

	public function new() {
		Assets.loadEverything(onLoad);
	}

	public function onLoad() {
		// instances
		sprite = new Rect(0.0, 0.0);

		System.notifyOnFrames(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);

		// kha.input.Keyboard.get().notify(Camera.onKeyDown, Camera.onKeyUp);
	}

	public function update() {
		Camera.update();
	}

	public function render(frames:Array<Framebuffer>) {
		var g = frames[0].g4;
		g.begin();
		g.clear(Color.fromFloats(0.0, 0.0, 0.3), 1.0);
		sprite.render(g);
		g.end();
	}
}
