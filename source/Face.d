import Point3d;
public import LineLoop;
import DrawAble;
//面のインターフェイス
//三角形や四角形がここから派生する
interface Face:DrawAble
{
	const
	{
		override void draw();
		override void vertex();
		@property const(LineLoop) side();
		@property const(LineSegment) normal_vector();
	}
	protected
	{
		void setNormalVector(in bool is_normal_front);
	}
}
