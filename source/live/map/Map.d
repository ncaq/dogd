module live.map.Map;

import shape.DrawAble;
import gl3n.linalg;

import live.map.Grid;
import live.map.Box;
import live.map.Light;
import live.map.Ground;

class Map:DrawAble
{
	this()
	{
		light_ = new Light(GL_LIGHT0,vec3(0,1,0),vec3(0,0,0),vec3(1,1,1));

		//box_ = new Box(vec4(0.5,0.5,0.5,0.5));
		grid_ = new Grid(0.1);
		ground_ = new Ground();
	}

	override void draw()
	{
		//box_.draw();
		grid_.draw();
		ground_.draw();
	}
	
	private
	{
		Light light_;

		Box box_;
		Grid grid_;
		Ground ground_;
	}
}
