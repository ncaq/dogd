import Point3d;
public import LineLoop;
import CanDrawObject;
//面のインターフェイス
//三角形や四角形がここから派生する
interface Face:CanDrawObject
{
	const
	{
		@property const(LineLoop) side();
		@property const(LineSegment) normal_vectol();
	}
}
