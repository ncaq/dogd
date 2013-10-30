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

			acccel_ =  0.01;
			limit_ = 0.02;
		}

		override void update()
		{
			super.update();
			camera_.position = this.position;
			camera_.sight = this.sight;
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
