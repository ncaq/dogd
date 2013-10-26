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
		auto distance = mouselog_.sumDelta();
		int width,height;
		glfwGetWindowSize(window_,&width,&height);
		scope(exit)
		{
			glfwSetCursorPos(window_,width / 2,height / 2);
			mouselog_.reset();
		}
		float sideper = distance.x / width;
		float  dipper = distance.y / height;
		float sideangle = 60 * sideper * -1;///degree 反時計周り座標です
		float  dipangle = 60 *  dipper * -1;

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
