module main;
import deimos.glfw3;
import shinh.opengl;
import core.thread;
import std.stdio;
import std.datetime;

void main(string[] args)
{
	if (!glfwInit())
	{
		assert(false,"init error");
	}

	GLFWwindow* window = glfwCreateWindow(1920,1080,"dogd",null,null);
	if(window is null)
	{
		glfwTerminate();
		assert(false,"nullpo");
	}

	glfwMakeContextCurrent(window);
	
	while (!glfwWindowShouldClose(window))
	{
		glfwSwapBuffers(window);
		glClear(GL_COLOR_BUFFER_BIT);

		glfwPollEvents();
	}
	glfwTerminate();
}
