module live.Human;
public import live.FailAble;

abstract class Human:FailAble
{
	override void update()
	{
		super.update();
	}

	override void frontTurn()
	{
		super.frontTurn();
		addSpeed(acccel_,limit_);
	}

	override void backTurn()
	{
		super.backTurn();
		addSpeed(acccel_,limit_);
	}
	
	override void leftTurn()
	{
		super.leftTurn();
		addSpeed(acccel_,limit_);
	}

	override void rightTurn()
	{
		super.rightTurn();
		addSpeed(acccel_,limit_);
	}


	protected
	{
		double acccel_;
		double limit_;
	}
}
