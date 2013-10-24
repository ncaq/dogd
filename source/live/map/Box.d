module live.map.Box;

import live.Live;
import gl3n.linalg;

class Box:Live
{
	this(in vec3 color,in real max=1,in real min=-1)
	{
		max_ = max;
		min_ = min;
		color_ = color;
	}

	override void update()
	{
	}
	
	const
	{
		void draw()
		{
			with(color_)//with文を使ってみたかった
			{
				glColor3f(x,y,z);
			}
				
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

			glColor3d(1,1,1);
		}
	}
	private
	{
		real max_;
		real min_;
		vec3 color_;
	}
}
