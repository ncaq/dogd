import Face;

class FaceTriangle:Face
{
	this(in LineSegment[3] iside,in LineSegment inormal_vectol)
	{
		foreach(i,e;iside)
		{
			side_[i] = new LineSegment(e);
		}
		normal_vectol_ = new LineSegment(inormal_vectol);
	}
	override void draw()
	{
	}
	const
	{
		override @property const(LineSegment[]) side()
		{
			return side_;
		}
		override @property const(LineSegment) normal_vectol()
		{
			return normal_vectol_;
		}
	}
	private
	{
		LineSegment[3] side_;
		LineSegment normal_vectol_;
	}
}
