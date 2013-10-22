module map.Map;

import shape.DrawAble;
import map.Grid;
import map.Box;
import map.Light;
import gl3n.linalg;

class Map:DrawAble
{
	this()
	{
		box_ = new Box(vec3(0.5,0.5,0.5));
		grid_ = new Grid(0.1);
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
