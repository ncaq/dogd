module manager.MouseMoveSight;

import deimos.glfw3;
import gl3n.linalg;
import gl3n.math;
import std.math;
import std.stdio;
import std.exception;
import manager.MouseLog;

class MouseMoveSight
{
	this(ref GLFWwindow* window)
	{
		window_ = window;
		mouselog_ = MouseLog.getInstance(window);
	}

	immutable(vec2d) get()
	{
		//todo playerを動かして,それに同期するように
		auto distance = mouselog_.sumDelta();
		int width,height;
		glfwGetWindowSize(window_,&width,&height);
		enforce(width  != 0);
		enforce(height != 0);
		scope(exit)
		{
			glfwSetCursorPos(window_,width / 2,height / 2);
			mouselog_.reset();
		}
		immutable double sideper = distance.x / width;
		immutable double  dipper = distance.y / height;
		immutable double sideangle = 60 * sideper * -1;///degree 反時計周り座標です
		immutable double  dipangle = 60 *  dipper * -1;

		debug
		{
			writeln("distance:",distance);
			writeln("sideangle:",sideangle);
			writeln(" dipangle:", dipangle);
		}
		return vec2d(radians(sideangle),radians(dipangle));
	}
	
	private
	{
		GLFWwindow* window_;
		MouseLog mouselog_ = null;
	}
}
