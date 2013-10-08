module Camera;
import deimos.glfw3;
import shinh.openglu;
import shape.Point3d;

class Camera
{
	this(in Point3d position,in Point3d camera,in Point3d up)
	{
		position_ = new Point3d(position);
		camera_ = new Point3d(camera);
		up_ = new Point3d(up);

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
		Point3d position_,camera_,up_;
	}
}
