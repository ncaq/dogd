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
	
		@property void inertia(in vec3d i)//set
		{
			direction_.x = atan2(i.z,i.x);
			immutable double base = hypot(i.x,i.z);
			direction_.y = atan2(i.y,base);
			speed_ = i.length;
		}

		void addInertia(in double a)
		{
			speed_ += a;
		}

		void rotateSight(in vec2d angle)
		{
			sight_ += angle;
		}

		@property void sight(in vec2d s)
		{
			sight_ = s;
		}

		void yturn(in double to,in double per=0.05)//toは相対角度,y = 2π*per
			in
			{
				assert(per >= 0);
				assert(per <= 1);
			}
		body
		{
			immutable double toangle = sight.x + to;
			immutable double block = cradians!(360)() * per;
			immutable double angledistance = toangle - direction_.x;
			immutable double minangledistance = min(cradians!(360)() - angledistance,angledistance);
			if(std.math.abs(minangledistance) < block)
			{
				direction_.x = toangle;
			}
			else
			{
				if(minangledistance > 0)
				{
					direction_.x += block;
				}
				else
				{
					direction_.x -= block;
				}
			}
		}

		const
		{
			//inertia = 慣性
			@property immutable(vec3d) inertia()//get
			{
				immutable spin90 = Matrix!(double,3,3).yrotation(cradians!(90)());
				immutable m = Matrix!(double,3,3).yrotation(direction_.x);
				immutable yspin = vec3d(0,0,-1) * m;
				immutable xzaxis = yspin * spin90;
				return (yspin * Matrix!(double,3,3).rotation(direction_.y,xzaxis)) * speed_;
			}

			@property immutable(vec2d) sight()
			{
				return sight_;
			}
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

	private
	{
		vec2d direction_;//動いている向き
		double speed_;

		vec2d sight_;//目が向いてる方向
	}
}
