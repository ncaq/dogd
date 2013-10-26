module shape.ConnectPoint;
public import gl3n.linalg;
import shape.DrawAble;
import shape.SingleShape;

interface ConnectPoint:DrawAble,SingleShape
{
	void add(in vec3d n);

	const
	{
		void draw();
		void vertex();
	}
}
