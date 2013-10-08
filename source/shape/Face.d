module shape.Face;
public import shape.Point3d;
import shape.ConnectPoint;
import shape.DrawAble;
import shape.SingleShape;
//面のインターフェイス
//三角形や四角形がここから派生する
interface Face:DrawAble,SingleShape
{
	const
	{
		override void draw();
		override void vertex();
		@property const(ConnectPoint) side();
		@property const(Point3d) normal(bool is_normal_front=false);
	}
}
