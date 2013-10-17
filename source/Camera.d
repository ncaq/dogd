module Camera;
import deimos.glfw3;
import shinh.openglu;
import gl3n.linalg;

class Camera
{
	this(in vec3 position,in vec3 camera,in vec3 up)
	{
		position_ = vec3(position);
		camera_ = vec3(camera);
		up_ = vec3(up);

		set();
	}

	void set()
	{
		gluLookAt(
			position_.x,position_.y,position_.z,
			camera_.x,camera_.y,camera_.z,
			up_.x,up_.y,up_.z);
	}

	private
	{
		vec3 position_,camera_,up_;
	}
}
