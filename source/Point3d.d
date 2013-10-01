import ImportGtkD;
import DrawAble;
import std.stdio;
class Point3d:DrawAble
{
	this(in double ix,in double iy,in double iz)
	{
		vector_[0] = ix;
		vector_[1] = iy;
		vector_[2] = iz;
	}
	///copy constructor
	this(in Point3d n)
	{
		vector_[0] = n.x;
		vector_[1] = n.y;
		vector_[2] = n.z;
	}
	void add(in Point3d n)
	{
		vector_[0] += n.x;
		vector_[1] += n.y;
		vector_[2] += n.z;
	}
	///get property
	const{
		override void draw()
		{
			glBegin(GL_POINTS);
			vertex();
			glEnd();
		}
		override void vertex()
		{
			glVertex3dv(vector);
		}
		@property double* vector()
		{
			return vector_.dup.ptr;
		}
		@property double x()
		{
			return vector_[0];
		}
		@property double y()
		{
			return vector_[1];
		}
		@property double z()
		{
			return vector_[2];
		}
	}
	private
	{
		double[3] vector_;
	}
}
