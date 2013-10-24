module live.LiveArray;

import live.Live;

class LiveArray
{
	void addObject(Live obj)
	{
		array_ ~= obj;
	}

	void eachUpdate()
	{
		foreach(e;array_)
		{
			e.update();
		}
	}
	
	void eachDraw()
	{
		foreach(e;array_)
		{
			e.draw();
		}
	}
	
	private
	{
		Live[] array_;
	}
}
