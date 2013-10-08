module main;
import deimos.glfw3;
import shape.FaceTriangle;

void main(string[] args)
{
	if (!glfwInit())
		assert(false,"init error");

	GLFWwindow* window = glfwCreateWindow(640, 480, "dogd",null,null);
	if (!window)
	{
		glfwTerminate();
		assert(false,"nullpo");
	}

	glfwMakeContextCurrent(window);

	while (!glfwWindowShouldClose(window))
	{
		glfwSwapBuffers(window);
		
		glfwPollEvents();
	}
	glfwTerminate();
}
