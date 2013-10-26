module manager.Camera;
import deimos.glfw3;
import shinh.opengl;
import shinh.openglu;
import gl3n.linalg;
import gl3n.math;
import std.stdio;

class Camera
{
	this(in vec3 position,in vec2 sight,in vec2 up)
	{
		position_ = vec3(position);
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
			sightangle_ = vec2(sv);
		}

		{
			auto uv = upangle_.vector;
			uv[] %= 360;
			upangle_ = vec2(uv);
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

	void xzRotateSight(in float angle)
	{
		//todo
		immutable axis = abs(yRotate(sight_,position_,cradians!(90)()) - position_).normalized();
		writeln("axis:",axis);
	}
	
	void yRotateSight(in float angle)
	{
		sightangle_.x += angle;
		set();
	}
	
	const
	{
		@property immutable(vec3) sight_()
		{
			//h = horizon
			//v = vertical
			return angleToVector(sightinitval_,sightangle_);
		}

		@property immutable(vec3) up_()
		{
			return angleToVector(upinitval_,upangle_);
		}

		immutable(vec3) angleToVector(in vec3 target,in vec2 angle)
		{
			immutable mat3 hmat = mat3.yrotation(angle.x);
			immutable vec3 hspin = target * hmat;
			immutable vec3 vaxis = hspin * mat3.yrotation(cradians!(90)());
			immutable mat3 vmat = mat3.rotation(angle.y,vaxis);
			immutable vec3 vspin = hspin * vmat;
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
			vec3 yRotate(in vec3 target,in vec3 origin,in float angle)
			{
				immutable m = mat3.yrotation(angle);
				return originProcess(target,origin,target => target * m);
			}

			vec3 originProcess(in vec3 target,in vec3 origin,vec3 delegate(vec3) func)
			{
				vec3 resume = target;
				resume -= origin;
				resume = func(resume);
				resume += origin;
				return resume;
			}
		}
		
		vec3 position_;
		vec2 sightangle_;
		static immutable vec3 sightinitval_ = vec3(0,0,-1);
		vec2 upangle_;
		static immutable vec3 upinitval_ = vec3(0,1,0);
	}
}
