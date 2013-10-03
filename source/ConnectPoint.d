public import Point3d;
public import DrawAble;

interface ConnectPoint:DrawAble
{
	void add(in Point3d n);

	const
	{
		void draw();
		void vertex();
	}
}
