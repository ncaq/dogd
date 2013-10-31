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
	}

	void set()
	{
		glMatrixMode(GL_MODELVIEW);
		glLoadIdentity();
		{
			//増え続けてOverflowするとか勘弁
			sightangle_.x %= 360;

			//カメラ反転はめんどくさいことになるだけなので,制限する
			immutable double min = cradians!(-90)();
			immutable double max = cradians!(90)();
			if(sightangle_.y < min)
			{
				sightangle_.y = min;
			}
			else
			{
				if(sightangle_.y > max)
				{
					sightangle_.y = max;
				}
			}
		}

		{
			upangle_ %= 360;
		}
		
		gluLookAt(
			position_.x,position_.y,position_.z,
			sight.x,sight.y,sight.z,
			up.x,up.y,up.z);
	}

	void rotateSight(in vec2d angle)
	{
		sightangle_ = angle;
	}
	
	void xzRotateSight(in double angle)
	{
		sightangle_.y += angle;
	}
	
	void yRotateSight(in double angle)
	{
		sightangle_.x += angle;
	}

	void rotateUp(in double angle)
	{
		upangle_ += angle;
	}
	
	@property position(in vec3d p)
	{
		position_ = p;
	}

	@property sight(in vec2d s)
	{
		sightangle_ = s;
	}

	const
	{
		@property immutable(vec3d) sight()
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

		@property immutable(vec3d) up()
		{
			immutable vaxis = sightinitval_ * mat3d.yrotation(sightangle_.x + cradians!(90)());
			immutable vspin = upinitval_ * mat3d.rotation(sightangle_.y,vaxis);
			return (vspin * mat3d.rotation(upangle_,sight));
		}
		
		void printDebug()
		{
			writeln("position:",position_);
			writeln("sight:",sight);
			writeln("up:",up);
			// writeln("sightangle:",degrees(sightangle_.x),",",degrees(sightangle_.y));
			// writeln("upangle:",degrees(upangle_));
		}
	}

	private
	{
		vec3d position_ = vec3d(0,0,0);
		vec2d sightangle_ = sightinitval_;
		static immutable vec3d sightinitval_ = vec3d(0,0,-1);
		double upangle_ = 0;
		static immutable vec3d upinitval_ = vec3d(0,1,0);
		alias Matrix!(double,3,3) mat3d;
	}
}
