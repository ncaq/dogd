module live.PlayerCharacter;
public import live.Human;
public import manager.Camera;

class PlayerCharacter:Human
{
	public
	{
		this(ref Camera camera)
		{
			super(0.01,0.1);
			camera_ = camera;
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
