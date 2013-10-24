module manager.MouseMoveSight;

import std.math;
import gl3n.linalg;
import deimos.glfw3;
import live.UpdateAble;
import manager.MouseLog;
import manager.Camera;

class MouseMoveSight:UpdateAble
{
	this(GLFWwindow* window,ref Camera camera)
	{
		window_ = window;
		mouselog_ = MouseLog.getInstance(window);
		camera_ = camera;
	}
	
	override void update()
	{
		auto distance = mouselog_.sumDelta();
		scope(exit)
		{
			mouselog_.clear();
		}
		int width,height;
		glfwGetWindowSize(window_,&width,&height);
		float sideper = distance.x / width;
		float  dipper = distance.y / height;
		float sideangle = sideper / 60;///degree
		float  dipangle =  dipper / 60;
		camera_.yRotateSight(sideangle);
		//camera_.
	}
	
	private
	{
		GLFWwindow* window_;
		MouseLog mouselog_ = null;
		Camera camera_;
	}
}
