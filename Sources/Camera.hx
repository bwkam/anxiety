import kha.math.FastMatrix3;
import kha.System;
import kha.input.KeyCode;
import kha.math.FastMatrix4;
import kha.Scheduler;
import kha.math.FastVector3;
import glm.GLM;

class Camera {
	public static var proj:FastMatrix4 = FastMatrix4.identity();
	public static var position:FastVector3 = new FastVector3(0, 0, 5); // Initial position: on +Z
	public static var horizontalAngle = 3.14; // Initial horizontal angle: toward -Z
	public static var verticalAngle = 0.0; // Initial vertical angle: none

	public static var lastTime = 0.0;

	public static var view:FastMatrix4 = FastMatrix4.identity();
	public static var look:FastVector3;

	public static function update() {
		var direction = new FastVector3(Math.cos(verticalAngle) * Math.sin(horizontalAngle), Math.sin(verticalAngle),
			Math.cos(verticalAngle) * Math.cos(horizontalAngle));

		// Right vector
		var right = new FastVector3(Math.sin(horizontalAngle - 3.14 / 2.0), 0, Math.cos(horizontalAngle - 3.14 / 2.0));

		// Up vector
		var up = right.cross(direction);

		// Look vector
		look = position.add(direction);

		var aspect = System.windowWidth() / System.windowHeight();
		var half_height = System.windowHeight() / 2.0;
		var half_width = half_height * aspect;
		var ortho_near = 0.0001;
		var ortho_far = 3000.0;

		// proj
		var w = System.windowWidth();
		var h = System.windowHeight();

		proj = new FastMatrix4(2.0 / w, 0.0, 0.0, 0.0, 0.0, 2.0 / h, 0.0, 0.0, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, 0.0, 1.0);
		// proj = GLM.orthographic(-half_width, half_width, -half_height, half_height, ortho_near, ortho_far, proj); // Camera matrix
		// proj = FastMatrix4.orthogonalProjection(0, w, 0, h, 0.1, 1000.0);

		// view = FastMatrix4.lookAt(position, // Camera is here
		// 	look, // and looks here : at the same position, plus "direction"
		// 	up // Head is up (set to (0, -1, 0) to look upside-down)
		// );

		view = FastMatrix4.identity();
	}
}
