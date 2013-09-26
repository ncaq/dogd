public import Point3d;
public import LineLoop;

//面のインターフェイス
//三角形や四角形がここから派生する
interface Face
{
	void draw();
	const
	{
		@property const(LineLoop) side();
		@property const(LineSegment) normal_vectol();
	}
}
