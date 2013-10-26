module shape.FaceTriangle;
import shinh.opengl;
public import shape.Face;
import shape.ConnectPoint3;

class FaceTriangle:Face
{
	this(in vec3d[3] iside,in bool isback=false)
	{
		side_ = new ConnectPoint3(iside);
		isback_ = isback;
	}
	this(in vec3d icenter,in double external_radius,in bool isback=false)
	{
		vec3d[3] s =
			[vec3d(icenter.x			,icenter.y - external_radius,icenter.z),
			 vec3d(icenter.x - external_radius	,icenter.y + external_radius,icenter.z),
			 vec3d(icenter.x + external_radius	,icenter.y + external_radius,icenter.z)];
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
			glNormal3f(normal.x,normal.y,normal.z);
			foreach(e;side_.points)
			{
				glVertex3f(e.x,e.y,e.z);
			}
		}

		override @property const(ConnectPoint3) side()
		{
			return side_;
		}
		
		override @property const(vec3d) normal(bool is_normal_front=false)
		{
			auto l = side_.points;

			if(is_normal_front)
			{
				//todo
				throw new Exception("setNormalVector back normal is not creat");
			}
			else
			{
				return cross(l[1] - l[0],l[2] - l[0]).normalized;
			}
		}
	}
	private
	{
		ConnectPoint3 side_;
		bool isback_;
	}
}
