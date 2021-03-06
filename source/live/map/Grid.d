module live.map.Grid;

import shape.DrawAble;
import gl3n.linalg;

class Grid:DrawAble
{
	this(in real gap)
	{
		gap_ = gap;
	}

	const
	{
		override void draw()
		{
			glPushMatrix();
			glMaterialfv(GL_FRONT_AND_BACK,GL_AMBIENT_AND_DIFFUSE,color_.vector.ptr);
			//x axis
			for(real y=-1;y <= 1;y+=gap_)
			{
				for(real z=-1;z <= 1;z+=gap_)
				{
						glBegin(GL_LINES);
						glVertex3d(-1,y,z);
						glVertex3d( 1,y,z);
						glEnd();
				}
			}

			//z axis
			for(real y=-1;y <= 1;y+=gap_)
			{
				for(real x=-1;x <= 1;x+=gap_)
				{
						glBegin(GL_LINES);
						glVertex3d(x,y,-1);
						glVertex3d(x,y, 1);
						glEnd();
				}
			}

			//y axis
			for(real x=-1;x <= 1;x+=gap_)
			{
				for(real z=-1;z <= 1;z+=gap_)
				{
						glBegin(GL_LINES);
						glVertex3d(x,-1,z);
						glVertex3d(x, 1,z);
						glEnd();
				}
			}
			glPopMatrix();
		}
	}
	
	private
	{
		real gap_;
		static vec4 color_ = vec4d(0,1,0,1);
	}
}
