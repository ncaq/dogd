module shape.FaceTriangle;
import shinh.opengl;
public import shape.Face;
import shape.ConnectPoint3;

class FaceTriangle:Face
{
	this(in Point3d[3] iside,in bool isback=false)
	{
		side_ = new ConnectPoint3(iside);
		isback_ = isback;
	}
	this(in Point3d icenter,in double external_radius,in bool isback=false)
	{
		const Point3d[3] s =
			[new Point3d(icenter + new Point3d(0,-external_radius,0,)),
			 new Point3d(icenter + new Point3d(-external_radius,external_radius,0)),
			 new Point3d(icenter + new Point3d(external_radius,external_radius,0))];
		side_ = new ConnectPoint3(s);
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
			foreach(e;side_.points)
			{
				e.vertex();
			}
		}

		override @property const(ConnectPoint3) side()
		{
			return side_;
		}
		
		override @property const(Point3d) normal(bool is_normal_front=false)
		{
			auto l = side_.points;

			if(is_normal_front)
			{
				//todo
				throw new Exception("setNormalVector back normal is not creat");
			}
			else
			{
				return normalize(vectorCross(l[1] - l[0],l[2] - l[0]));
			}
		}
	}
	private
	{
		ConnectPoint3 side_;
		bool isback_;
	}
}
