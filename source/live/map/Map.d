module live.map.Map;

import shape.DrawAble;
import gl3n.linalg;

import live.map.Grid;
import live.map.Box;
import live.map.Light;

class Map:DrawAble
{
	this()
	{
		box_ = new Box(vec3(0.5,0.5,0.5));
		grid_ = new Grid(0.05);
		//todo
		//light_ = new Light(GL_LIGHT0,vec3(0,1,0),vec3(0.9,0.9,0.9));
	}
	const
	{
		void draw()
		{
			box_.draw();
			grid_.draw();
		}
	}
	private
	{
		Box box_;
		Grid grid_;
		Light light_;
	}
}
