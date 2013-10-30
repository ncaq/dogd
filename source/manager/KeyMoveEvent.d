module manager.KeyMoveEvent;

public import manager.KeyLog;
public import live.PlayerCharacter;

abstract class KeyMoveEvent
{
	this(ref GLFWwindow* window,ref PlayerCharacter p)
	{
		window_ = window;
		player = p;
		log_ = KeyLog.getInstance(window_);
	}

	void update()
	{
	}

	protected
	{
		KeyLog log_ = null;
		GLFWwindow* window_;
		PlayerCharacter player;

		Tuple!(Tuple!(GlfwKey,GlfwMod),void function ())[] task;
	}
}
