module live.Human;
public import live.FailAble;

abstract class Human:FailAble
{
	override void update()
	{
		super.update();
	}

	void rotateSight(in vec2d angle)
	{
		sight_ += angle;
	}

	@property void sight(in vec2d s)
	{
		sight_ = s;
	}

	const
	{
		@property immutable(vec2d) sight()
		{
			return sight_;
		}
	}

	private
	{
		vec2d sight_;
	}
}
