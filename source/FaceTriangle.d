import Face;
import ImportGtkD;

class FaceTriangle:Face
{
	this(in LineSegment[3] iside,in bool isback=false)
	{
		side_ = new LineLoop(iside);
		isback_ = isback;
		setNormalVector(isback);
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
	protected override void setNormalVector(in bool is_normal_front=false)
	{
		auto l = side_.lines;
		auto v =  vectorCross(new Point3d(l[1].front - l[0].front),
				      new Point3d(l[2].front - l[0].front));
		if(is_normal_front)
		{
			//todo
			throw new Excption("setNormalVector back normal is not creat");
		}
		else
		{
			normal_vector = v;
		}
	}
	private
	{
		LineLoop side_;
		Point3d normal_vector_;
		bool isback_;
	}
}
