module live.PlayerCharacter;
import live.Human;
import manager.Camera;

class PlayerCharacter:Human
{
	public
	{
		this(ref Camera camera)
		{
			camera_ = camera;
		}

		override void update()
		{
		}

		const
		{
			void draw()
			{
			}
		}
	}

	private
	{
		Camera camera_;
	}
}
