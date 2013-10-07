module shape.ConnectPoint;
public import shape.Point3d;
public import shape.DrawAble;

interface ConnectPoint:DrawAble
{
	void add(in Point3d n);

	const
	{
		void draw();
		void vertex();
	}
}
