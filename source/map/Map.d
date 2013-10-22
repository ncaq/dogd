module map.Map;

import shape.DrawAble;
import map.Grid;
import map.Box;

class Map:DrawAble
{
	this()
	{
		box_ = new Box();
		grid_ = new Grid(0.1);
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
	}
}
