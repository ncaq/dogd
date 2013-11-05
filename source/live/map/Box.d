module live.map.Box;

import live.Live;
import gl3n.linalg;

class Box
{
	this(in vec4 color,in double max=1,in double min=-1)
	{
		max_ = max;
		min_ = min;
		color_ = color;
	}

	public
	{
		void update()
		{
		}
		
		void draw()
		{
			glPushMatrix();
			glMaterialfv(GL_FRONT_AND_BACK,GL_AMBIENT_AND_DIFFUSE,color_.vector.ptr);

			//up
			glBegin(GL_QUADS);
			glVertex3d(min_,max_,min_);
			glVertex3d(min_,max_,max_);
			glVertex3d(max_,max_,max_);
			glVertex3d(max_,max_,min_);
			glEnd();

			//down
			glBegin(GL_QUADS);
			glVertex3d(min_,min_,min_);
			glVertex3d(max_,min_,min_);
			glVertex3d(max_,min_,max_);
			glVertex3d(min_,min_,max_);
			glEnd();

			//left
			glBegin(GL_QUADS);
			glVertex3d(min_,max_,min_);
			glVertex3d(min_,min_,min_);
			glVertex3d(min_,min_,max_);
			glVertex3d(min_,max_,max_);
			glEnd();

			//right
			glBegin(GL_QUADS);
			glVertex3d(max_,max_,min_);
			glVertex3d(max_,max_,max_);
			glVertex3d(max_,min_,max_);
			glVertex3d(max_,min_,min_);
			glEnd();

			//near
			glBegin(GL_QUADS);
			glVertex3d(min_,max_,min_);
			glVertex3d(max_,max_,min_);
			glVertex3d(max_,min_,min_);
			glVertex3d(min_,min_,min_);
			glEnd();

			//far
			glBegin(GL_QUADS);
			glVertex3d(min_,max_,max_);
			glVertex3d(min_,min_,max_);
			glVertex3d(max_,min_,max_);
			glVertex3d(max_,max_,max_);
			glEnd();

			glPopMatrix();
		}
	}
	
	private
	{
		double max_;
		double min_;
		vec4 color_;
	}
}
