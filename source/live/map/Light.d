module live.map.Light;

import shinh.opengl;
import shinh.openglu;
import gl3n.linalg;
import gl3n.math;

class Light
{
	this(in uint GL_LIGHT_N,in vec3 position,in vec3 color)
	{
		position_ = position;
		color_ = color;
		GL_LIGHT_N_ = GL_LIGHT_N;

		set();
		
		glEnable(GL_LIGHTING);
		glEnable(GL_LIGHT_N_);
	}

	void set()
	{
		glLightfv(GL_LIGHT_N_,GL_POSITION,position_.value_ptr);
		// glLightfv(GL_LIGHT_N_,GL_AMBIENT,color_.value_ptr);
		// glLightfv(GL_LIGHT_N_,GL_DIFFUSE,color_.value_ptr);
		// glLightfv(GL_LIGHT_N_,GL_SPECULAR,color_.value_ptr);
	}
	
	private
	{
		vec3 position_;
		vec3 color_;
		uint GL_LIGHT_N_;
	}
}
