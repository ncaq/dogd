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
			//systemのKeymapが適用されなくて白目
			addTask(GLFW_KEY_W,0,&player_.moveFront);
			addTask(GLFW_KEY_S,0,&player_.moveBack);
			addTask(GLFW_KEY_A,0,&player_.moveLeft);
			addTask(GLFW_KEY_D,0,&player_.moveRight);
		}
	}
}
