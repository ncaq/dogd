module manager.LiveManager;

import live.Live;

class LiveManager
{
	void addObject(Live obj)
	{
		array_ ~= obj;
	}

	void eachUpdate()
	{
		foreach(ref e;array_)
		{
			e.update();
		}
	}
	
	void eachDraw()
	{
		foreach(ref e;array_)
		{
			e.draw();
		}
	}

	void map(void delegate(in Live) func)
	{
		foreach(ref e;array_)
		{
			func(e);
		}
	}
	
	private
	{
		Live[] array_ = null;
	}
}
