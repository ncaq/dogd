module main;
import deimos.glfw3;
import shinh.opengl;
import shinh.openglu;
import gl3n.math;
import shape.FaceTriangle;
import Camera;
import core.thread;
import std.stdio;

void main(string[] args)
{
	if (!glfwInit())
	{
		assert(false,"init error");
	}

	GLFWwindow* window = glfwCreateWindow(1000,800,"dogd",null,null);
	if(window is null)
	{
		glfwTerminate();
		assert(false,"nullpo");
	}

	glfwMakeContextCurrent(window);

	auto triangle = new FaceTriangle([ vec3(0,0,1), vec3(0,0.5,1), vec3(1,0,1)]);
	auto camera = new Camera( vec3(0.5,0,0.5), vec3(0.5,0,1), vec3(0,1,0));
	float rocate = cradians!(1)();
	writeln(rocate);
	
	while (!glfwWindowShouldClose(window))
	{
		glfwSwapBuffers(window);
		glClear(GL_COLOR_BUFFER_BIT);

		glfwPollEvents();

		triangle.draw();

		camera.set();
		camera.yRotateSight(rocate);

		Thread.sleep(dur!("msecs")(10));
	}
	glfwTerminate();
}
