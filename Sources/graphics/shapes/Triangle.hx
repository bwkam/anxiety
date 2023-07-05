package graphics.shapes;

class Triangle extends Shape {
	public function init() {
		_vertices = [
			-1.0, -1.0,
			 1.0, -1.0,
			 0.0,  1.0,
		];
		_indices = [0, 1, 2];
	}
}
