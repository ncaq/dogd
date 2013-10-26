module shape.ConnectPoint3;
import shape.ConnectPoint;
import shinh.opengl;

class ConnectPoint3:ConnectPoint
{
	this(in vec3d[3] ip)
	{
		points_[0] = vec3d(ip[0]);
		points_[1] = vec3d(ip[1]);
		points_[2] = vec3d(ip[2]);
	}
	
	override void add(in vec3d n)
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
				glVertex3f(e.x,e.y,e.z);
			}
		}

		@property const(vec3d[3]) points()
		{
			return points_;
		}
	}
	
	private
	{
		vec3d[3] points_;
	}
}
