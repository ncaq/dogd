class Point3d
{
	this(in real ix,in real iy,in real iz)
	{
		x = ix;
		y = iy;
		z = iz;
	}
	///copy constructor
	this(in Point3d n)
	{
		x = n.x;
		y = n.y;
		z = n.z;
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
	///set property
	@property void x(in real ix)
	{
		x_ = ix;
	}
	@property void y(in real iy)
	{
		y_ = iy;
	}
	@property void z(in real iz)
	{
		z_ = iz;
	}
	private real x_,y_,z_;
}
