module manager.Game;

import deimos.glfw3;
import shinh.opengl;
import shinh.openglu;
import gl3n.linalg;
import gl3n.math;

import live.map.Map;
import manager.Player;
import shape.FaceTriangle;

class Game
{
	this()
	{
		glEnable(GL_DEPTH_TEST);//todo move to view manager class

		glInit();
		memberInit();
	}

	void memberInit()
	{
		player_ = new Player(window_);
		map_ = new Map();
		t_ = new FaceTriangle([vec3(0,0,0.9),vec3(1,0,0.9),vec3(0.5,1,0.9)]);//todo delete because this is test code.
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

	void run()
	{
		scope(exit) glfwTerminate();

		while (!glfwWindowShouldClose(window_))
		{
			glfwSwapBuffers(window_);
			glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);

			player_.update();
			map_.draw();
			t_.draw();//todo delete

			glfwPollEvents();
		}
	}

	private
	{
		GLFWwindow* window_;
		Player player_;
		Map map_;

		FaceTriangle t_;
	}
}