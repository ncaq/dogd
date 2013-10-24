module manager.Camera;
import deimos.glfw3;
import shinh.opengl;
import shinh.openglu;
import gl3n.linalg;
import gl3n.math;
import std.stdio;

class Camera
{
	this(in vec3 position,in vec3 sight,in vec3 up)
	{
		position_ = vec3(position);
		sight_ = vec3(sight);
		up_ = vec3(up);

		glMatrixMode(GL_PROJECTION);
		glLoadIdentity();
		gluPerspective(60,1920/1080,0,1);
		glMatrixMode(GL_MODELVIEW);

		set();
	}

	void set()
	{
		//sight_ = originProcess(sight_,position_,delegate(target){return target.normalized();});
		
		glMatrixMode(GL_MODELVIEW);
		glLoadIdentity();
		gluLookAt(
			position_.x,position_.y,position_.z,
			sight_.x,sight_.y,sight_.z,
			up_.x,up_.y,up_.z);

		debug
		{
			printDebug();
		}
	}

	void antedeviation(in float angle)
	{
		immutable axis = abs(yRotate(sight_,position_,cradians!(90)()) - position_).normalized();
		writeln("axis:",axis);
	}
	
	void yRotateSight(in float angle)
	{
		sight_ = yRotate(sight_,position_,angle);
		set();
	}
	
	const
	{
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
				return originProcess(target,origin,delegate(target){return target * m;});
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
		
		vec3 position_,sight_,up_;
	}
}
