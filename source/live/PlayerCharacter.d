module live.PlayerCharacter;
public import live.Human;
public import manager.Camera;
import live.Barrett;

class PlayerCharacter:Human
{
	public
	{
		this(ref Camera camera,ref LiveManager l)
		{
			super(vec3d(0,-0.9,0),0.005,0.01,l);
			camera_ = camera;
		}

		override void update()
		{
			super.update();
			camera_.position = this.position;
			camera_.sight = this.sight;
		}

		void fire()
		{
			livemanager_.addObject(new Barrett(position,sight_,livemanager_));
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
