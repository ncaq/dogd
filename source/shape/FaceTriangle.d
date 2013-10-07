module shape.FaceTriangle;
import ImportGtkD;
public import shape.Face;
public import shape.Point3d;

class FaceTriangle:Face
{
	this(in Point3d[3] iside,in bool isback=false)
	{
		side_ = new LineLoop(iside);
		isback_ = isback;
	}
	this(in Point3d icenter,in double external_radius,in bool isback=false)
	{
		const Point3d[3] s =
			[new Point3d(icenter + new Point3d(0,-external_radius,0,)),
			 new Point3d(icenter + new Point3d(-external_radius,external_radius,0)),
			 new Point3d(icenter + new Point3d(external_radius,external_radius,0))];
		side_ = new LineLoop(s);
		isback_ = isback;
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
			glNormal3dv(normal.vectorv);
			side_.vertex();
		}
		override @property const(LineLoop) side()
		{
			return side_;
		}
		override @property const(Point3d) normal(bool is_normal_front=false)
		{
			auto l = side_.lines;
			auto v = normalize(vectorCross(l[1].front - l[0].front,l[2].front - l[0].front));
			if(is_normal_front)
			{
				//todo
				throw new Exception("setNormalVector back normal is not creat");
			}
			else
			{
				return v;
			}
		}
	}
	private
	{
		LineLoop side_;
		bool isback_;
	}
}
