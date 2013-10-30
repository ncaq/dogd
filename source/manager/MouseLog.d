module manager.MouseLog;

import deimos.glfw3;
import gl3n.linalg;
import std.stdio;
import std.array;

class MouseLog///singleton
{
	public
	{
		void pushPosD(GLFWwindow* window,in double x,in double y)
		{
			pos_ ~= vec2d(x,y);
		}

		void reset()
		{
			pos_ = null;
		}
		
		void restart()
		{
			if(!pos_.empty)
			{
				pos_ = [pos_[$-1]];
			}
		}

		static MouseLog getInstance(GLFWwindow* window)///and create
		{
			if(instance_ is null)
			{
				instance_ = new MouseLog();
				glfwSetCursorPosCallback(window,&pushPosC);
			}
			return instance_;
		}

		const
		{
			vec2d sumDelta()
			{
				vec2d diff = vec2d(0,0);
				if(pos_.length > 1)
				{
					diff = pos_[$-1] - pos_[0];
				}
				return diff;
			}
		}
	}
	
	private
	{
		static MouseLog instance_ = null;
		
		vec2d[] pos_;
	}
}

extern(C)
{
	void pushPosC(GLFWwindow* window,double x,double y)
	{
		MouseLog.getInstance(window).pushPosD(window,x,y);
	}
}
