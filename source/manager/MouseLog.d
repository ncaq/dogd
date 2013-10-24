module manager.Mouselog;

import deimos.glfw3;
import gl3n.linalg;

class MouseLog///singleton
{
	public
	{
		static MouseLog getInstance(GLFWwindow* window)///and create
		{
			if(isexist_)
			{
				instance_ = new MouseLog();
				isexist_ = true;
				glfwSetCursorPosCallback(window,&pushPosC);
			}
			return instance_;
		}

		void clear()
		{
			posdiff_ = [];
		}
		
		void pushPosD(GLFWwindow* window,in double x,in double y)
		{
			posdiff_ ~= vec2(x,y);
		}

		const
		{
			vec2 sumDelta()
			{
				double x = 0,y = 0;
				
				foreach(e;posdiff_)
				{
					x += e.x;
					y += e.y;
				}
				
				return vec2(x,y);
			}
		}
	}
	
	private
	{
		static bool isexist_ = false;
		static MouseLog instance_ = null;
		
		vec2[] posdiff_;
	}
}

extern(C)
{
	void pushPosC(GLFWwindow* window,double x,double y)
	{
		MouseLog.getInstance(window).pushPosD(window,x,y);
	}
}
