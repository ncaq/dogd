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

		void clear()
		{
			auto t = pos_[0];
			pos_ = [pos_[0]];
		}
		
		void pushPosD(GLFWwindow* window,in double x,in double y)
		{
			debug
			{
				writeln("Mouse","x:",x,"y:",y);
			}
			pos_ ~= vec2(x,y);
		}

		const
		{
			vec2 sumDelta()
			{
				vec2 diff;
				for(uint i;i+1 < pos_.length;++i)
				{
					diff = pos_[++i] - pos_[i];
				}
				
				return diff;
			}
		}
	}
	
	private
	{
		static bool isexist_ = false;
		static MouseLog instance_ = null;
		
		vec2[] pos_;
	}
}

extern(C)
{
	void pushPosC(GLFWwindow* window,double x,double y)
	{
		MouseLog.getInstance(window).pushPosD(window,x,y);
	}
}
