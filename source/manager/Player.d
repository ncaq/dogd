module manager.Player;

import gl3n.linalg;
import gl3n.math;
import deimos.glfw3;
import live.UpdateAble;
import live.PlayerCharacter;
import manager.Camera;
import manager.MouseMoveEvent;
import manager.Dvorak;

class Player:UpdateAble
{
	this(ref GLFWwindow* window)
	{
		window_ = window;
		camera_ = new Camera(vec3d(0,0,0),vec2d(0,0),0);
		char_ = new PlayerCharacter(camera_);
		mouse_ = new MouseMoveEvent(window_,char_);
		key_ = new Dvorak(window_,char_);
	}

	override void update()
	{
		camera_.set();
		char_.update();
		mouse_.update();
		key_.update();
	}
	
	private
	{
		GLFWwindow* window_;
		Camera camera_;
		PlayerCharacter char_;
		MouseMoveEvent mouse_;
		KeyMoveEvent key_;
	}
}
