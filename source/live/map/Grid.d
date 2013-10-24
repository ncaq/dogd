module live.map.Grid;

import shape.DrawAble;

class Grid:DrawAble
{
	this(in real gap)
	{
		gap_ = gap;
	}

	const
	{
		void draw()
		{
			//x axis
			for(real y=-1;y <= 1;y+=gap_)
			{
				for(real z=-1;z <= 1;z+=gap_)
				{
						glColor3d(1,0,0);
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
						glColor3d(1,0,0);
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
						glColor3d(1,0,0);
						glBegin(GL_LINES);
						glVertex3d(x,-1,z);
						glVertex3d(x, 1,z);
						glEnd();
				}
			}
			glColor3d(1,1,1);
		}
	}
	
	private
	{
		real gap_;
	}
}
