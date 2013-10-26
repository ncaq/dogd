module manager.MouseLog;

import deimos.glfw3;
import gl3n.linalg;
import std.stdio;

class MouseLog///singleton
{
	public
	{
		static MouseLog getInstance(GLFWwindow* window)///and create
		{
			if(!isexist_)
			{
				instance_ = new MouseLog();
				isexist_ = true;
				glfwSetCursorPosCallback(window,&pushPosC);
			}
			return instance_;
		}

		void reset()
		{
			pos_ = null;
		}
		
		void restart()
		{
			if(pos_.length != 0)
			{
				pos_ = pos_[$-1 .. $];
			}
		}
		
		void pushPosD(GLFWwindow* window,in double x,in double y)
		{
			pos_ ~= vec2d(x,y);
		}

		const
		{
			vec2d sumDelta()
			{
				debug
				{
					writeln("pos_:",pos_);
				}
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
		static bool isexist_ = false;
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
