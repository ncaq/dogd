module main;
import deimos.glfw3;
import shape.FaceTriangle;
import Camera;

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

	auto t = new FaceTriangle([ vec3(0,0,0), vec3(0,0.5,0), vec3(1,0,0)]);
	auto c = new Camera( vec3(0,0,0), vec3(0,0,1), vec3(0,1,0));
	while (!glfwWindowShouldClose(window))
	{
		glfwSwapBuffers(window);

		

		glfwPollEvents();
	}
	glfwTerminate();
}
