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

	auto t = new FaceTriangle([new Point3d(0,0,0),new Point3d(0,0.5,0),new Point3d(1,0,0)]);
	auto c = new Camera(new Point3d(0,0,0),new Point3d(0,0,1),new Point3d(0,1,0));
	while (!glfwWindowShouldClose(window))
	{
		glfwSwapBuffers(window);

		

		glfwPollEvents();
	}
	glfwTerminate();
}
