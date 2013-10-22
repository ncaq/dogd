module main;
import deimos.glfw3;
import shinh.opengl;
import core.thread;
import std.stdio;
import std.datetime;

import gl3n.linalg;
import gl3n.math;
import shape.FaceTriangle;
import manager.Camera;
import map.Map;

void main(string[] args)
{
	if (!glfwInit())
	{
		assert(false,"init error");
	}

	glEnable(GL_DEPTH_TEST);

	GLFWwindow* window = glfwCreateWindow(1920,1080,"dogd",null,null);
	if(window is null)
	{
		glfwTerminate();
		assert(false,"nullpo");
	}

	glfwMakeContextCurrent(window);

	auto t = new FaceTriangle([vec3(0,0,0.9),vec3(1,0,0.9),vec3(0.5,1,0.9)]);
	auto c = new Camera(
		vec3(0,0,-1),
		vec3(0.5,-0.5,0.9),
		vec3(0,1,0));

	auto m = new Map();
	while (!glfwWindowShouldClose(window))
	{
		glfwSwapBuffers(window);
		glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);

		c.set();
		m.draw();
		t.draw();
		//c.yRotateSight(cradians!(1)());

		glFlush();
		glfwPollEvents();
	}
	glfwTerminate();
}
