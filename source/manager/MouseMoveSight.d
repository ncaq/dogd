module manager.MouseMoveSight;

import deimos.glfw3;
import gl3n.linalg;
import gl3n.math;
import live.UpdateAble;
import manager.Camera;
import manager.MouseLog;
import std.math;
import std.stdio;

class MouseMoveSight:UpdateAble
{
	this(ref GLFWwindow* window,ref Camera camera)
	{
		window_ = window;
		mouselog_ = MouseLog.getInstance(window);
		camera_ = camera;
	}
	
	override void update()
	{
		//todo playerを動かして,それに同期するように
		auto distance = mouselog_.sumDelta();
		int width,height;
		glfwGetWindowSize(window_,&width,&height);
		scope(exit)
		{
			glfwSetCursorPos(window_,width / 2,height / 2);
			mouselog_.reset();
		}
		double sideper = distance.x / width;
		double  dipper = distance.y / height;
		double sideangle = 60 * sideper * -1;///degree 反時計周り座標です
		double  dipangle = 60 *  dipper * -1;

		debug
		{
			writeln("windowsize:",width,",",height);
			writeln("distance:",distance);
			writeln("sideper:",sideper);
			writeln(" dipper:", dipper);
			writeln("sideangle:",sideangle);
			writeln(" dipangle:", dipangle);
		}
		
		camera_.yRotateSight(radians(sideangle));
		camera_.xzRotateSight(radians(dipangle));
	}
	
	private
	{
		GLFWwindow* window_;
		MouseLog mouselog_ = null;
		Camera camera_;
	}
}
