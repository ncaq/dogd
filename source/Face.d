import Point3d;
public import LineLoop;
import DrawAble;
//面のインターフェイス
//三角形や四角形がここから派生する
interface Face:DrawAble
{
	override void draw();
	override void vertex();
	const
	{
		@property const(LineLoop) side();
		@property const(LineSegment) normal_vectol();
	}
}
