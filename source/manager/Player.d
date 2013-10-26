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
		playercharacter_ = new PlayerCharacter();
		camera_ = new Camera(vec3d(0,0,0),vec2d(0,0),0);
		mouse_ = new MouseMoveSight(window_,camera_);
	}

	override void update()
	{
		playercharacter_.update();
		mouse_.update();

		//camera_.yRotateSight(cradians!(1)());//todo delete
	}
	
	private
	{
		GLFWwindow* window_;
		PlayerCharacter playercharacter_;
		Camera camera_;
		MouseMoveSight mouse_;
	}
}
