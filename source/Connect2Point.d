import Point3d;

class Connect2Point
{
	this(in Point3d ifront,in Point3d iback)
	{
		front_ = new Point3d(ifront);
		back_  = new Point3d(iback);
	}
	void add(in Point3d n)
	{
		front_.add(n);
		back_.add(n);
	}
	private Point3d front_;
	private Point3d back_;
}
