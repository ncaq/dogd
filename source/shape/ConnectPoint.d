module shape.ConnectPoint;
public import shape.Point3d;
import shape.DrawAble;
import shape.SingleShape;

interface ConnectPoint:DrawAble,SingleShape
{
	void add(in Point3d n);

	const
	{
		void draw();
		void vertex();
	}
}
