module shape.ConnectPoint2;
public import gl3n.linalg;
import shape.ConnectPoint;
import shinh.opengl;

class ConnectPoint2:ConnectPoint
{
	this(in vec3d ifront,in vec3d iback)
	{
		front_ = vec3d(ifront);
		back_  = vec3d(iback);
	}
	this(in ConnectPoint2 n)
	{
		front_ = vec3d(n.front);
		back_  = vec3d(n.back);
	}
	void add(in vec3d n)
	{
		front_ += n;
		back_  += n;
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
			glVertex3f(front.x,front.y,front.z);
			glVertex3f(back.x,back.y,back.z);
		}
		@property const(vec3d) front()
		{
			return front_;
		}
		@property const(vec3d) back()
		{
			return back_;
		}
	}
	private
	{
		vec3d front_;
		vec3d back_;
	}
}
