import ImportGtkD;
import CanDrawObject;
class Point3d:CanDrawObject
{
	this(in real ix,in real iy,in real iz)
	{
		x_ = ix;
		y_ = iy;
		z_ = iz;
	}
	///copy constructor
	this(in Point3d n)
	{
		x_ = n.x;
		y_ = n.y;
		z_ = n.z;
	}
	override void draw()
	{
		glBegin(GL_POINTS);
		glVertex3d(x,y,z);
		glEnd();
	}
	void add(in Point3d n)
	{
		x_ += n.x;
		y_ += n.y;
		z_ += n.z;
	}
	///get property
	const{
		@property real x()
		{
			return x_;
		}
		@property real y()
		{
			return y_;
		}
		@property real z()
		{
			return z_;
		}
	}
	private
	{
		real x_,y_,z_;
	}
}
