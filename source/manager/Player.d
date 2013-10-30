module manager.Player;

import gl3n.linalg;
import gl3n.math;
import deimos.glfw3;
import live.UpdateAble;
import live.PlayerCharacter;
import manager.Camera;
import manager.MouseMoveEvent;
import manager.KeyLog;

class Player:UpdateAble
{
	this(ref GLFWwindow* window)
	{
		window_ = window;
		camera_ = new Camera(vec3d(0,0,0),vec2d(0,0),0);
		playercharacter_ = new PlayerCharacter(camera_);
		mouse_ = new MouseMoveEvent(window_,playercharacter_);
	}

	override void update()
	{
		camera_.set();
		playercharacter_.update();
		mouse_.update();
	}
	
	private
	{
		GLFWwindow* window_;
		Camera camera_;
		PlayerCharacter playercharacter_;
		MouseMoveEvent mouse_;
	}
}
