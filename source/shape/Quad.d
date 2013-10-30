module shape.Quad;

import gl3n.linalg;
import gl3n.math;
import shinh.opengl;
import shape.DrawAble;
import shape.Color;

class Quad:DrawAble
{
	this(in vec3d[4] edge,in Color[4] color)
	{
		edge_ = edge;
		
		foreach(i,e;color)
		{
			color_[i] = new Color(e.vector());
		}
	}
	
	override void draw()
	{
		glBegin(GL_QUADS);
		for(ushort i=0;i < 4;++i)
		{
			color_[i].materialAD();
			glVertex3dv(edge_[i].vector.ptr);
		}
		glEnd();
	}

	private
	{
		vec3d[4] edge_;
		Color[4] color_;
	}
}

