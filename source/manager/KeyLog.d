module manager.KeyLog;

import deimos.glfw3;
import std.typecons;
import std.algorithm;
import std.array;

alias int GlfwKey;
alias int GlfwAction;
alias int GlfwMod;

class KeyLog
{
	public
	{
		void pushKeyD(in GLFWwindow* window,in GlfwKey key,in int scancode,in GlfwAction action,in GlfwMod mods)
		{
			filter(key,action,mods);
		}

		void filter(GlfwKey key,GlfwAction action,GlfwMod mods)
		{
			if(action != GLFW_RELEASE)
			{
				key_ ~= tuple(key,mods);
			}
		}

		void reset()
		{
			key_ = null;
		}

		static KeyLog getInstance()
		{
			if(instance_ is null)
			{
				instance_ = new KeyLog();
			}
			return instance_;
		}

		const
		{
			immutable(bool) isPush(GlfwKey k,GlfwMod m=0)
			{
				return find(key_,tuple(k,m)).empty;
			}
		}
	}
	
	private
	{
		static KeyLog instance_;
		Tuple!(GlfwKey,GlfwMod)[] key_;
	}
}

extern(C)
{
	void pushKeyC(GLFWwindow* window,int key,int scancode,int action,int mods)
	{
		KeyLog.getInstance().pushKeyD(window,key,scancode,action,mods);
	}
}
