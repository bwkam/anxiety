package graphics.shapes;

class Rect extends Shape {
	public function init() {
		_vertices = [
			  0.0,   0.0, 0.0,
			  0.0, 480.0, 0.0,
			640.0, 480.0, 0.0,
			640.0,   0.0, 0.0,
		];
		// _indices = [0, 1, 3, 1, 2, 3];
		_indices = [0, 1, 2, 0, 2, 3];
	}
	// _indices = [0, 1, 1, 1, 1, 1];
}
