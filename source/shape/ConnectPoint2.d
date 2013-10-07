module shape.ConnectPoint2;
public import shape.Point3d;
import shape.ConnectPoint;

class ConnectPoint2:ConnectPoint
{
	this(in Point3d ifront,in Point3d iback)
	{
		front_ = new Point3d(ifront);
		back_  = new Point3d(iback);
	}
	this(in ConnectPoint2 n)
	{
		front_ = new Point3d(n.front);
		back_  = new Point3d(n.back);
	}
	void add(in Point3d n)
	{
		front_.add(n);
		back_.add(n);
	}
	const
	{
		override void draw()
		{
			glBegin(GL_POINTS);
			vertex();
			glEnd();
		}
		override void vertex()
		{
			front.vertex();
			back.vertex();
		}
		@property const(Point3d) front()
		{
			return front_;
		}
		@property const(Point3d) back()
		{
			return back_;
		}
	}
	private
	{
		Point3d front_;
		Point3d back_;
	}
}
