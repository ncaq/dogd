module shape.ConnectPoint2;
public import gl3n.linalg;
import shape.ConnectPoint;
import shinh.opengl;

class ConnectPoint2:ConnectPoint
{
	this(in vec3 ifront,in vec3 iback)
	{
		front_ = vec3(ifront);
		back_  = vec3(iback);
	}
	this(in ConnectPoint2 n)
	{
		front_ = vec3(n.front);
		back_  = vec3(n.back);
	}
	void add(in vec3 n)
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
		@property const(vec3) front()
		{
			return front_;
		}
		@property const(vec3) back()
		{
			return back_;
		}
	}
	private
	{
		vec3 front_;
		vec3 back_;
	}
}
