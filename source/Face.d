public import Point3d;
public import LineSegment;

//面のインターフェイス
//三角形や四角形がここから派生する
interface Face
{
	void draw();
	const
	{
		@property LineSegment normal_vectol();
	}
}
