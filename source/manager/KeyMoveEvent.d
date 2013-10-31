module manager.KeyMoveEvent;

public import manager.KeyLog;
public import live.PlayerCharacter;

abstract class KeyMoveEvent
{
	this(ref GLFWwindow* window,ref PlayerCharacter p)
	{
		window_ = window;
		player_ = p;
		log_ = KeyLog.getInstance(window_);
	}

	void update()
	{
		exeTask();
	}

	void exeTask()
	{
		foreach(e;task)
		{
			if(log_.isPush(e[0].expand))
			{
				e[1]();
			}
		}
		log_.reset();
	}

	void addTask(in GlfwKey k,in GlfwMod m,void delegate() d)
	{
		GlfwKey mk = k;//mutable k
		GlfwMod mm = m;
		task ~= tuple(tuple(mk,mm),d);
	}

	protected
	{
		KeyLog log_ = null;
		GLFWwindow* window_;
		PlayerCharacter player_;

		Tuple!(Tuple!(GlfwKey,GlfwMod),void delegate())[] task;
	}
}
