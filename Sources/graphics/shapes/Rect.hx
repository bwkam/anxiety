package graphics.shapes;

class Rect extends Shape {
	public function init() {
		_vertices = [
			 0.5,  0.5,
			 0.5, -0.5,
			-0.5, -0.5,
			-0.5,  0.5,
		];
		_indices = [0, 1, 3, 1, 2, 3];
	}
}
