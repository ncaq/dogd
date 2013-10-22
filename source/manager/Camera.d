module manager.Camera;
import deimos.glfw3;
import shinh.openglu;
import gl3n.linalg;

class Camera
{
	this(in vec3 position,in vec3 sight,in vec3 up)
	{
		position_ = vec3(position);
		sight_ = vec3(sight);
		up_ = vec3(up);

		set();
	}

	void set()
	{
		gluLookAt(
			sight_.x,sight_.y,sight_.z,
			position_.x,position_.y,position_.z,
			up_.x,up_.y,up_.z);
	}

	void yRotateSight(in float alpha)
	{
		immutable mat = Matrix!(float,3,3).yrotation(alpha);

		sight_ -= position_;
		sight_ = sight_ * mat;
		sight_ += position_;
	}

	private
	{
		vec3 position_,sight_,up_;
	}
}
