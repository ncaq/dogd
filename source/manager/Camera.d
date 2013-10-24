module manager.Camera;
import deimos.glfw3;
import shinh.opengl;
import shinh.openglu;
import gl3n.linalg;

class Camera
{
	this(in vec3 position,in vec3 sight,in vec3 up)
	{
		position_ = vec3(position);
		sight_ = vec3(sight);
		up_ = vec3(up);

		glMatrixMode(GL_PROJECTION);
		glLoadIdentity();
		gluPerspective(30,1920/1080,0,1);
		glMatrixMode(GL_MODELVIEW);

		set();
	}

	void set()const
	{
		glMatrixMode(GL_MODELVIEW);
		glLoadIdentity();
		gluLookAt(
			position_.x,position_.y,position_.z,
			sight_.x,sight_.y,sight_.z,
			up_.x,up_.y,up_.z);
	}

	void yRotateSight(in float alpha)
	{
		immutable mat = Matrix!(float,3,3).yrotation(alpha);

		sight_ -= position_;
		sight_ = sight_ * mat;
		sight_ += position_;

		set();
	}

	private
	{
		vec3 position_,sight_,up_;
	}
}
