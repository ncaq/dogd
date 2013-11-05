module manager.MouseMoveEvent;

import deimos.glfw3;
import gl3n.linalg;
import gl3n.math;
import std.math;
import std.stdio;
import std.exception;
import manager.MouseLog;
import live.PlayerCharacter;

class MouseMoveEvent
{
	this(ref GLFWwindow* window,ref PlayerCharacter p,ref Camera c)
	{
		window_ = window;
		char_ = p;
		camera_ = c;
		mouselog_ = MouseLog.getInstance(window);
	}

	void update()
	{
		cameraSyncPlayer();
	}

	void cameraSyncPlayer()
	{
		char_.rotateSight(getMove());
	}
	
	immutable(vec2d) getMove()
	{
		//todo playerを動かして,それに同期するように
		immutable distance = mouselog_.sumDelta();
		int width,height;
		glfwGetWindowSize(window_,&width,&height);
		enforce(width  != 0);
		enforce(height != 0);
		scope(exit)
		{
			glfwSetCursorPos(window_,width / 2,height / 2);//中央に戻す
			mouselog_.reset();
		}
		immutable double sideper = distance.x / width;
		immutable double  dipper = distance.y / height;
		immutable double sideangle = camera_.zoom() * sideper * -1;///degree 反時計周り座標です
		immutable double  dipangle = camera_.zoom() *  dipper * -1;

		return vec2d(radians(sideangle),radians(dipangle));
	}
	
	private
	{
		GLFWwindow* window_;
		MouseLog mouselog_ = null;
		PlayerCharacter char_;
		Camera camera_;
	}
}
