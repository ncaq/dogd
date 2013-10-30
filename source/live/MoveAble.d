module live.MoveAble;

public import live.Live;

abstract class MoveAble:Live
{
	public
	{
		void update()
		{
			silde();
		}
	
		const
		{
			//inertia = 慣性
			@property immutable(vec3d) inertia()//get
			{
				immutable spin90 = Matrix!(double,3,3).yrotation(cradians!(90)());
				immutable m = Matrix!(double,3,3).yrotation(sightangle_.x);
				immutable yspin = vec3d(0,0,-1) * m;
				immutable xzaxis = yspin * spin90;
				return (yspin * Matrix!(double,3,3).rotation(sightangle_.y,xzaxis)) * speed_;
			}
		}
		
		@property void inertia(in vec3d i)//set
		{
			sightangle_.x = atan2(i.z,i.x);
			immutable double base = hypot(i.x,i.z);
			sightangle_.y = atan2(i.y,base);
			speed_ = i.length;
		}

		void addInertia(in double a)
		{
			speed_ += a;
		}
	}

	private
	{
		final void silde()//スライド
		{
			if(speed_ < 0.1)
			{
				speed_ = 0;
			}
			else
			{
				speed_ /= 2;
				position =  position + inertia;
			}
		}
	}

	protected
	{
		vec2d sightangle_;
		double speed_;
	}
}
