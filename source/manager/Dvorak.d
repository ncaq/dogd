module manager.Dvorak;
public import manager.KeyMoveEvent;

class Dvorak:KeyMoveEvent
{
	this(ref GLFWwindow* window,ref PlayerCharacter p)
	{
		super(window,p);
		setTask();
	}

	private
	{
		void setTask()
		{
			addTask(GLFW_KEY_COMMA,0,&player_.frontTurn);
			addTask(GLFW_KEY_O,0,&player_.backTurn);
			addTask(GLFW_KEY_A,0,&player_.leftTurn);
			addTask(GLFW_KEY_E,0,&player_.rightTurn);
		}
	}
}
