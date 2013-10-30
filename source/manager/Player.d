module manager.Player;

import gl3n.linalg;
import gl3n.math;
import deimos.glfw3;
import live.UpdateAble;
import live.PlayerCharacter;
import manager.Camera;
import manager.MouseMoveSight;

class Player:UpdateAble
{
	this(ref GLFWwindow* window)
	{
		window_ = window;
		camera_ = new Camera(vec3d(0,0,0),vec2d(0,0),0);
		playercharacter_ = new PlayerCharacter(camera_);
		mouse_ = new MouseMoveSight(window_);
	}

	override void update()
	{
		immutable rotate = mouse_.get();
		playercharacter_.update();
		playercharacter_.rotate(rotate);
		camera_.rotateSight(rotate);
	}
	
	private
	{
		GLFWwindow* window_;
		Camera camera_;
		PlayerCharacter playercharacter_;
		MouseMoveSight mouse_;
	}
}
