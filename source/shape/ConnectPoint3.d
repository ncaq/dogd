module shape.ConnectPoint3;
import shape.ConnectPoint;
import shinh.opengl;

class ConnectPoint3:ConnectPoint
{
	this(in Point3d[3] ip)
	{
		points_[0] = new Point3d(ip[0]);
		points_[1] = new Point3d(ip[1]);
		points_[2] = new Point3d(ip[2]);
	}
	
	override void add(in Point3d n)
	{
		foreach(ref e;points_)
		{
			e = e + n;
		}
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
			foreach(e;points_)
			{
				e.vertex();
			}
		}

		@property const(Point3d[3]) points()
		{
			return points_;
		}
	}
	
	private
	{
		Point3d[3] points_;
	}
}
