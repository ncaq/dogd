module live.Barrett;

import live.HitAble;

class Barrett:HitAble
{
	this(in vec3d pos,in vec2d angle,ref LiveManager l,in double r=0.05)
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
		vec4 v = vec4(0.9,0.1,0.1,0.5);
		glMaterialfv(GL_FRONT_AND_BACK,GL_AMBIENT_AND_DIFFUSE,v.vector.ptr);

		glBegin(GL_QUADS);
		glVertex3d(p.x-r,p.y-r,p.z+r);
		glVertex3d(p.x+r,p.y-r,p.z+r);
		glVertex3d(p.x+r,p.y+r,p.z+r);
		glVertex3d(p.x-r,p.y+r,p.z+r);
		glEnd();

		glPopMatrix();
	}
}
