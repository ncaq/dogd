module live.GameObjectArray;

import live.GameObject;

class GameObjectArray
{
	void addObject(GameObject obj)
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
		GameObject[] array_;
	}
}
