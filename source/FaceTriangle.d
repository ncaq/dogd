import Face;
import ImportGtkD;

class FaceTriangle:Face
{
	this(in LineSegment[3] iside,in bool is_normal_front)
	{
		side_ = new LineLoop(iside);
		setNormalVector(is_normal_front);
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
			//todo glNormal3dv(normal_vectol_.vector);
			side_.vertex();
		}
		override @property const(LineLoop) side()
		{
			return side_;
		}
		override @property const(LineSegment) normal_vector()
		{
			return normal_vector_;
		}
	}
	protected override void setNormalVector(in bool is_normal_front)
	{
		//todo
	}
	private
	{
		LineLoop side_;
		LineSegment normal_vector_;
	}
}
