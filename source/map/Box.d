module map.Box;

import shinh.opengl;
import shinh.openglu;

import shape.DrawAble;

class Box:DrawAble
{
	const
	{
		void draw()
		{
			immutable max =  0.9;
			immutable min =  -0.9;

			//up
			glColor3d(max,max,max);
			glBegin(GL_QUADS);
			glVertex3d(min,max,min);
			glVertex3d(min,max,max);
			glColor3d(min,min,min);
			glVertex3d(max,max,max);
			glVertex3d(max,max,min);
			glEnd();

			//down
			glColor3d(max,max,max);
			glBegin(GL_QUADS);
			glVertex3d(min,min,min);
			glVertex3d(max,min,min);
			glColor3d(min,min,min);
			glVertex3d(max,min,max);
			glVertex3d(min,min,max);
			glEnd();

			//left
			glColor3d(max,max,max);
			glBegin(GL_QUADS);
			glVertex3d(min,max,min);
			glVertex3d(min,min,min);
			glColor3d(min,min,min);
			glVertex3d(min,min,max);
			glVertex3d(min,max,max);
			glEnd();

			//right
			glColor3d(max,max,max);
			glBegin(GL_QUADS);
			glVertex3d(max,max,min);
			glVertex3d(max,max,max);
			glColor3d(min,min,min);
			glVertex3d(max,min,max);
			glVertex3d(max,min,min);
			glEnd();

			//near
			glColor3d(max,max,max);
			glBegin(GL_QUADS);
			glVertex3d(min,max,min);
			glVertex3d(max,max,min);
			glColor3d(min,min,min);
			glVertex3d(max,min,min);
			glVertex3d(min,min,min);
			glEnd();

			//far
			glColor3d(max,max,max);
			glBegin(GL_QUADS);
			glVertex3d(min,max,max);
			glVertex3d(min,min,max);
			glColor3d(min,min,min);
			glVertex3d(max,min,max);
			glVertex3d(max,max,max);
			glEnd();

			glColor3d(1,1,1);
		}
	}
}
