module manager.Camera;
import deimos.glfw3;
import shinh.opengl;
import shinh.openglu;
import gl3n.linalg;
import gl3n.math;
import std.stdio;

class Camera
{
	this(in vec3d position,in vec2d sight,in vec2d up)
	{
		position_ = vec3d(position);
		sightangle_ = sight;
		upangle_ = up;

		glMatrixMode(GL_PROJECTION);
		glLoadIdentity();
		gluPerspective(60,1920/1080,0,1);
		glMatrixMode(GL_MODELVIEW);

		set();
	}

	void set()
	{
		glMatrixMode(GL_MODELVIEW);
		glLoadIdentity();

		{
			auto sv = sightangle_.vector;
			sv[] %= 360;
			sightangle_ = vec2d(sv);
		}

		{
			auto uv = upangle_.vector;
			uv[] %= 360;
			upangle_ = vec2d(uv);
		}
		
		gluLookAt(
			position_.x,position_.y,position_.z,
			sight_.x,sight_.y,sight_.z,
			up_.x,up_.y,up_.z);

		debug
		{
			printDebug();
		}
	}

	void xzRotateSight(in double angle)
	{
		sightangle_.y += angle;
		set();
	}
	
	void yRotateSight(in double angle)
	{
		sightangle_.x += angle;
		set();
	}
	
	const
	{
		@property immutable(vec3d) sight_()
		{
			//h = horizon
			//v = vertical
			return angleToVector(sightinitval_,sightangle_);
		}

		@property immutable(vec3d) up_()
		{
			return angleToVector(upinitval_,upangle_);
		}

		immutable(vec3d) angleToVector(in vec3d target,in vec2d angle)
		{
			immutable mat3d hmat = mat3d.yrotation(angle.x);
			immutable vec3d hspin = target * hmat;
			immutable vec3d vaxis = hspin * mat3d.yrotation(cradians!(90)());
			immutable mat3d vmat = mat3d.rotation(angle.y,vaxis);
			immutable vec3d vspin = hspin * vmat;
			return vspin + position_;
		}
		
		void printDebug()
		{
			writeln("position:",position_);
			writeln("sight:",sight_);
			writeln("up:",up_);
		}
	}

	private
	{
		const
		{
			vec3d yRotate(in vec3d target,in vec3d origin,in double angle)
			{
				immutable m = mat3d.yrotation(angle);
				return originProcess(target,origin,target => target * m);
			}

			vec3d originProcess(in vec3d target,in vec3d origin,vec3d delegate(vec3d) func)
			{
				vec3d resume = target;
				resume -= origin;
				resume = func(resume);
				resume += origin;
				return resume;
			}
		}
		
		vec3d position_;
		vec2d sightangle_;
		static immutable vec3d sightinitval_ = vec3d(0,0,-1);
		vec2d upangle_;
		static immutable vec3d upinitval_ = vec3d(0,1,0);
	}
}
