package;

import kha.System;

class Main {
	public static function main() {
		System.start({title: "Project", width: 640, height: 480}, function(_) {
			// new PhysicsWorld({
			// 	width: System.windowWidth(),
			// 	height: System.windowHeight(),
			// });

			new Scene();
		});
	}
}
