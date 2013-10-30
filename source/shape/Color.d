module shape.Color;

import gl3n.linalg;
import shinh.opengl;

class Color
{
	this(in vec4 color)
	{
		color_ = color;
	}

	this(in float x,in float y,in float z,in float w)
	{
		color_= vec4(x,y,z,w);
	}

	void materialAD()
	{
		glMaterialfv(GL_FRONT_AND_BACK,GL_AMBIENT_AND_DIFFUSE,color_.vector.ptr);
	}

	const
	{
		immutable(vec4) vector()
		{
			return color_;
		}
	}
	
	private
	{
		vec4 color_;
	}
}
