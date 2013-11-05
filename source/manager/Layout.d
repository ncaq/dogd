module manager.Layout;
public import manager.KeyMoveEvent;
public import live.PlayerCharacter;

class Layout:KeyMoveEvent
{
	this(ref GLFWwindow* window,ref PlayerCharacter p,ref Camera c)
	{
		super(window);
		playerChar_ = p;
		camera_ = c;
		setTask();
	}

	private
	{
		void setTask()
		{
			//systemのKeymapが適用されなくて白目
			//WASD移動
			addTask(GLFW_KEY_W,0,&playerChar_.moveFront);
			addTask(GLFW_KEY_S,0,&playerChar_.moveBack);
			addTask(GLFW_KEY_A,0,&playerChar_.moveLeft);
			addTask(GLFW_KEY_D,0,&playerChar_.moveRight);

			//zoom in out
			addTask(GLFW_KEY_Z,0,&camera_.zoomIn);
			addTask(GLFW_KEY_X,0,&camera_.zoomOut);
		}

		PlayerCharacter playerChar_;
		Camera camera_;
	}
}
