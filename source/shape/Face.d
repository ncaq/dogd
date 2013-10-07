module shape.Face;
public import shape.Point3d;
public import shape.LineLoop;
import shape.DrawAble;
//面のインターフェイス
//三角形や四角形がここから派生する
interface Face:DrawAble
{
	const
	{
		override void draw();
		override void vertex();
		@property const(LineLoop) side();
		@property const(Point3d) normal(bool is_normal_front=false);
	}
}
