module manager.Camera;
import deimos.glfw3;
import shinh.opengl;
import shinh.openglu;
import gl3n.linalg;
import gl3n.math;
import std.stdio;

class Camera
{
	this(in vec3d position,in vec2d sight,in double up)
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
			upangle_ %= 360;
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

	void rotateUp(in double angle)
	{
		upangle_ += angle;
	}
	
	const
	{
		@property immutable(vec3d) sight_()
		{
			//h = horizon
			//v = vertical
			immutable hmat = mat3d.yrotation(sightangle_.x);
			immutable vec3d hspin = sightinitval_ * hmat;
			immutable vec3d vaxis = hspin * mat3d.yrotation(cradians!(90)());
			immutable vmat = mat3d.rotation(sightangle_.y,vaxis);
			immutable vec3d vspin = hspin * vmat;
			return vspin + position_;
		}

		@property immutable(vec3d) up_()
		{
			immutable vaxis = sightinitval_ * mat3d.yrotation(sightangle_.x + cradians!(90)());
			immutable vspin = upinitval_ * mat3d.rotation(sightangle_.y,vaxis);
			return vspin * mat3d.rotation(upangle_,sight_);
		}
		
		void printDebug()
		{
			writeln("position:",position_);
			writeln("sight:",sight_);
			writeln("up:",up_);
			writeln("sightangle",sightangle_);
			writeln("upangle",upangle_);
		}
	}

	private
	{
		vec3d position_;
		vec2d sightangle_;
		static immutable vec3d sightinitval_ = vec3d(0,0,-1);
		double upangle_;
		static immutable vec3d upinitval_ = vec3d(0,1,0);
		alias Matrix!(double,3,3) mat3d;
	}
}
