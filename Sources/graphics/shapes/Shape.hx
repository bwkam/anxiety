package graphics.shapes;

import kha.math.FastVector2;
import kha.math.FastMatrix4;
import kha.graphics4.Graphics;
import kha.graphics4.Usage;
import kha.Shaders;
import kha.graphics4.VertexData;
import kha.graphics4.VertexStructure;
import kha.graphics4.ConstantLocation;
import kha.graphics4.VertexBuffer;
import kha.graphics4.IndexBuffer;
import kha.graphics4.PipelineState;

abstract class Shape {
	private var _pipeline:PipelineState;

	private var _vertices:Array<Float>;
	private var _indices:Array<Int>;

	private var _structureLength:Int;

	private var _vertexBuffer:VertexBuffer;
	private var _indexBuffer:IndexBuffer;

	private var _projID:ConstantLocation;
	private var _viewID:ConstantLocation;
	private var _modelID:ConstantLocation;

	private var _model:FastMatrix4;

	// props
	public var x(default, set):Float = 0.0;
	public var y(default, set):Float = 0.0;

	@:isVar
	public var width(get, set):Float = 1.0;
	public var height(default, set):Float = 1.0;

	// public var size(get, set):Float;

	public function new(x:Float, y:Float) {
		init();

		// props
		this.x = x;
		this.y = y;

		var structure = new VertexStructure();
		structure.add("pos", VertexData.Float3);

		_pipeline = new PipelineState();
		_pipeline.inputLayout = [structure];
		_pipeline.fragmentShader = Shaders.simple_frag;
		_pipeline.vertexShader = Shaders.simple_vert;
		_pipeline.colorAttachmentCount = 1;
		_pipeline.colorAttachments[0] = kha.graphics4.TextureFormat.RGBA32;
		_pipeline.depthStencilAttachment = kha.graphics4.DepthStencilFormat.Depth16;
		_pipeline.compile();

		// handles
		_projID = _pipeline.getConstantLocation("proj");
		_viewID = _pipeline.getConstantLocation("view");
		_modelID = _pipeline.getConstantLocation("model");
		// _screenDimID = _pipeline.getConstantLocation("screen_dim");

		// the transformation matrices
		_model = FastMatrix4.identity();
		// _model = FastMatrix4.translation(this.x, this.y, 0.0);
		// _model = _model.multmat(FastMatrix4.scale(100.0, 100.0, 1.0));

		_vertexBuffer = new VertexBuffer(Std.int(_vertices.length / 3), structure, Usage.StaticUsage,);

		var vbData = _vertexBuffer.lock();
		for (i in 0...vbData.length) {
			vbData.set(i, _vertices[i]);
		}
		_vertexBuffer.unlock();

		_indexBuffer = new IndexBuffer(_indices.length, Usage.StaticUsage,);
		var iData = _indexBuffer.lock();
		for (i in 0...iData.length) {
			iData[i] = _indices[i];
		}
		_indexBuffer.unlock();
	}

	abstract public function init():Void;

	function set_x(v:Float) {
		return x = v;
	}

	function set_y(v:Float) {
		return y = v;
	}

	function get_width():Float {
		return width;
	}

	function set_width(v:Float):Float {
		return width = v;
	}

	function set_height(v:Float) {
		return this.height = v;
	}

	public function render(g:Graphics) {
		g.setPipeline(_pipeline);

		g.setVertexBuffer(_vertexBuffer);
		g.setIndexBuffer(_indexBuffer);

		g.setMatrix(_projID, Camera.proj);
		g.setMatrix(_viewID, Camera.view);
		g.setMatrix(_modelID, _model);

		// g.setVector2(_screenDimID, new FastVector2(640, 480));

		g.drawIndexedVertices();
	}
}
