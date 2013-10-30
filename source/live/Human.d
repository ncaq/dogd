module live.Human;
public import live.FailAble;

abstract class Human:FailAble
{
	override void update()
	{
		super.update();
	}

	void rotate(in vec2d angle)
	{
		direction_ = angle;
	}
}
