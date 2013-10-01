import Face;
import ImportGtkD;

class FaceTriangle:Face
{
	this(in LineSegment[3] iside,in LineSegment inormal_vectol)
	{
		side_ = new LineLoop(iside);
		normal_vectol_ = new LineSegment(inormal_vectol);
	}
	const
	{
		override void draw()
		{
			glBegin(GL_TRIANGLES);
			vertex();
			glEnd();
		}
		override void vertex()
		{
			//todo
		}
		override @property const(LineLoop) side()
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
		LineLoop side_;
		LineSegment normal_vectol_;
	}
}
