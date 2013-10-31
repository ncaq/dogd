module live.Human;
public import live.FailAble;

abstract class Human:FailAble
{
	this(in double accsel,in double fastest)
	{
		acceleration_ = accsel;
		fastest_ = fastest;
	}

	override void update()
	{
		super.update();
	}

	void accsel()
	{
		if(speed + acceleration_ < fastest_)
		{
			addSpeed(acceleration_);
		}
	}
	
	void moveFront()
	{
		turnFront();
		accsel();
	}

	void moveBack()
	{
		turnBack();
		accsel();
	}

	void moveLeft()
	{
		turnLeft();
		accsel();
	}

	void moveRight()
	{
		turnRight();
		accsel();
	}
	
	protected
	{
		double acceleration_;
		double fastest_;
	}
}
