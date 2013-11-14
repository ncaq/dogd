module live.Barrett;

import live.HitAble;
import live.map.Box;

class Barrett:HitAble
{
	this(in vec3d pos,in vec2d angle,ref LiveManager l,in double r=0.1)
	{
		super(pos,r,l);
		direction_ = angle;
	}

	override void update()
	{
		turnFront();
		addSpeed(0.005);
		super.update();
	}

	void draw()
	{
		immutable p = this.position;
		alias this.r_ r;

		glPushMatrix();
		vec4 v = vec4(1,0,0,1);
		glMaterialfv(GL_FRONT_AND_BACK,GL_AMBIENT_AND_DIFFUSE,v.vector.ptr);

		glBegin(GL_QUADS);
		glVertex3d(p.x-r,p.y-r,p.z+r);
		glVertex3d(p.x-r,p.y+r,p.z+r);
		glVertex3d(p.x+r,p.y+r,p.z+r);
		glVertex3d(p.x+r,p.y-r,p.z+r);
		glEnd();

		glBegin(GL_QUADS);
		glVertex3d(p.x-r,p.y-r,p.z+r);
		glVertex3d(p.x+r,p.y-r,p.z+r);
		glVertex3d(p.x+r,p.y+r,p.z+r);
		glVertex3d(p.x-r,p.y+r,p.z+r);
		glEnd();

		glPopMatrix();

		debug
		{
			import std.stdio;
			// writeln("p:",p);
			// writeln("r:",r);
			writeln("position:",position);
			//writeln("sight:",sight);
			writeln("dir:",direction_);
			writeln("speed:",speed_);
		}
	}
}
