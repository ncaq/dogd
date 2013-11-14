module manager.Game;

import deimos.glfw3;
import shinh.opengl;
import shinh.openglu;
import gl3n.linalg;
import gl3n.math;

import live.map.Map;
import manager.LiveManager;
import manager.Player;

class Game
{
	this()
	{
		glEnable(GL_DEPTH_TEST);//todo move to view manager class

		glInit();
		memberInit();
	}

	void glInit()
	{
		if (!glfwInit())
		{
			assert(false,"init error");
		}
		
		window_ = glfwCreateWindow(1920,1080,"dogd",null,null);
		if(window_ is null)
		{
			glfwTerminate();
			assert(false,"create window is fail!");
		}

		glfwMakeContextCurrent(window_);

		glfwSwapInterval(2);//vsync? 後で調べる

		glfwSetInputMode(window_,GLFW_CURSOR,GLFW_CURSOR_HIDDEN);
	}

	void memberInit()
	{
		try
		{
			manager_ = new LiveManager();
			player_ = new Player(window_,manager_);
			manager_.addObject(player_.getPlayerChar());
			map_ = new Map();
		}
		catch(Throwable e)
		{
			import std.stdio;
			writeln(e);
		}
	}
	
	void run()
	{
		scope(exit)
		{
			glfwTerminate();
		}

		while (!glfwWindowShouldClose(window_))
		{
			glfwSwapBuffers(window_);
			glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);

			player_.update();
			manager_.eachUpdate();
			manager_.eachDraw();
			map_.draw();

			glfwPollEvents();
		}
	}

	private
	{
		GLFWwindow* window_;
		LiveManager manager_;
		Player player_;
		Map map_;
	}
}
