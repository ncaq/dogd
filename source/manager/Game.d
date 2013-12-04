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

		glEnable(GL_DEPTH_TEST);
	}

	void memberInit()
	{
		manager_ = new LiveManager();
		player_ = new Player(window_,manager_);
		manager_.addObject(player_.getPlayerChar());
		map_ = new Map();
	}
	
	void run()
	{
		scope(exit)
		{
			glfwTerminate();
		}

		while (!glfwWindowShouldClose(window_))
		{
			glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);

			player_.update();
			manager_.eachUpdate();

			map_.draw();
			manager_.eachDraw();

			glfwPollEvents();
			glfwSwapBuffers(window_);
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

void glTest()
{
	vec4 green = vec4(0,1,0,0);
	glBegin(GL_TRIANGLES);
	glMaterialfv(GL_FRONT_AND_BACK,GL_AMBIENT_AND_DIFFUSE,green.vector.ptr);
	glVertex3d(   0, 0.5,-0.4);
	glVertex3d(-0.8,-0.4,-0.4);
	glVertex3d( 0.8,-0.4,-0.4);
	glEnd();

	vec4 red = vec4(1,0,0,0);
	glBegin(GL_TRIANGLES);
	glMaterialfv(GL_FRONT_AND_BACK,GL_AMBIENT_AND_DIFFUSE,red.vector.ptr);
	glVertex3d(   0,0.5,-0.5);
	glVertex3d(-0.5,0.0,-0.5);
	glVertex3d( 0.5,0.0,-0.5);
	glEnd();

	// vec4 blue = vec4(0,0,1,0);
	// glBegin(GL_TRIANGLES);
	// glMaterialfv(GL_FRONT_AND_BACK,GL_AMBIENT_AND_DIFFUSE,blue.vector.ptr);
	// glVertex3d(   0,0.5,-0.8);
	// glVertex3d(   0,0.0,-0.8);
	// glVertex3d( 0.5,0.0,-0.8);
	// glEnd();
}
