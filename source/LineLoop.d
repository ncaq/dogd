import LineSegment;
import DrawAble;
import ImportGtkD;
class LineLoop:DrawAble
{
	this(in LineSegment[] a)
	{
		foreach(e;a)
		{
			lines_ ~= new LineSegment(e);
		}
	}
	const
	{
		override void draw()
		{
			glBegin(GL_LINE_LOOP);
			vertex();
			glEnd();
		}
		override void vertex()
		{
			foreach(e;lines_)
			{
				e.vertexFront();//To select only head vertex
			}
		}
		@property const(LineSegment[]) lines()
		{
			return lines_;
		}
	}
	private
	{
		LineSegment[] lines_;
		//loop check
		invariant()
		{
			//todo
		}
	}
}
