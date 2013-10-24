module manager.Game;

import deimos.glfw3;
import shinh.opengl;
import shinh.openglu;
import gl3n.linalg;
import gl3n.math;

import live.map.Map;
import manager.Camera;
import shape.FaceTriangle;

class Game
{
	this()
	{
		glEnable(GL_DEPTH_TEST);//todo move to view manager class

		memberInit();
	}

	void memberInit()
	{
		camera_ = new Camera(
			vec3(0,0,0),
			vec3(0.5,-0.5,0.9),
			vec3(0,1,0));
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
			assert(false,"nullpo");
		}

		glfwMakeContextCurrent(window_);

		glfwSwapInterval(2);//vsync? 後で調べる
	}

	void run()
	{
		scope(exit) glfwTerminate();

		glInit();

		while (!glfwWindowShouldClose(window_))
		{
			glfwSwapBuffers(window_);
			glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);

			map_.draw();
			t_.draw();//todo delete
			camera_.yRotateSight(cradians!(1)());//todo delete

			glfwPollEvents();
		}
	}

	private
	{
		GLFWwindow* window_;
		Camera camera_;
		Map map_;

		FaceTriangle t_;
	}
}
