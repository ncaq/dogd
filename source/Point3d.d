import ImportGtkD;
import DrawAble;
import std.stdio;
import std.math;
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
	this(in double[] n)
	{
		vector_[0] = n[0];
		vector_[1] = n[1];
		vector_[2] = n[2];
	}
	void add(in Point3d n)
	{
		vector_[0] += n.x;
		vector_[1] += n.y;
		vector_[2] += n.z;
	}
	ref Point3d opOpAssign(string op)(in double n)//depend opBinary at down page
		if(op == "+" || op == "-" || op == "*" || op == "/")
		{
			//vector_[] = this.opBinary!(op)(n).vector;
			mixin("vector_[]" ~ op ~ "= n;");
			return this;
		}
	const
	{
		override void draw()
		{
			glBegin(GL_POINTS);
			vertex();
			glEnd();
		}
		override void vertex()
		{
			glVertex3dv(vectorv);
		}
		Point3d opBinary(string op)(in double n)//enable vector calc
			if(op == "+" || op == "-" || op == "*" || op == "/")
			{
				double[3] array;
				array[] = mixin("vector_[]" ~ op ~ "n;");
				return new Point3d(array);
			}
		///get property
		@property double[3] vector()
		{
			return vector_;
		}
		@property double* vectorv()
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

Point3d normalize(in Point3d n)
{
	immutable double length = sqrt((n.x ^^ 2) + (n.y ^^ 2) + (n.z ^^ 2));
	auto vector = new Point3d(n);
	vector /= length;
	return vector;
}

Point3d vectorCross(in Point3d v0,in Point3d v1)
{
	return new Point3d(v0.y * v1.z - v0.z * v1.x,
			   v0.z * v1.x - v0.x * v1.z,
			   v0.x * v1.y - v0.y * v1.x);
}
