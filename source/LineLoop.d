import DrawAble;
import ImportGtkD;
import LineSegment;
import Point3d;

class LineLoop:DrawAble
{
	this(in LineSegment[] a)
	{
		foreach(e;a)
		{
			lines_ ~= new LineSegment(e);
		}
	}
	this(in Point3d[] a)
	{
		for(uint i=0;i < a.length;++i)
		{
			const Point3d next = (i + 1 < a.length) ? a[i+1] : a[0];
			lines_ ~= new LineSegment(a[i],next);
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
