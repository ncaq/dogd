module live.MoveAble;

public import live.Live;

abstract class MoveAble:Live
{
	public
	{
		void update()
		{
			sight_.x %= 360;
			sight_.y = min(max(sight_.y,cradians!(-90)()),cradians!(90)());
			silde();
		}
	
		@property void inertia(in vec3d i)//set
		{
			direction_.x = atan2(i.z,i.x);
			immutable double base = hypot(i.x,i.z);
			direction_.y = atan2(i.y,base);
			speed_ = i.length;
		}

		void setSpeed(in double a,in double limit=0)
		{
			if(limit == 0)
			{
				speed_ = a;
			}
			else
			{
				speed_ = min(a,limit);
			}
		}
		void addSpeed(in double a,in double limit=0)//0==unlimit
		{
			if(limit == 0)
			{
				speed_ += a;
			}
			else
			{
				if(speed_ + a < limit)
				{
					speed_ += a;
				}
			}
		}

		void yTurn(in double to,in double per=0.05)//toは相対角度,y = 2π*per
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

	void frontTurn()
	{
		yTurn(cradians!(0)());
	}

	void backTurn()
	{
		yTurn(cradians!(180)());
	}
	
	void leftTurn()
	{
		yTurn(cradians!(90)());
	}

	void rightTurn()
	{
		yTurn(cradians!(-90)());
	}
	
	void rotateSight(in vec2d angle)
	{
		sight_ += angle;
	}

	private
	{
		final void silde()//スライド
		{
			if(speed_ != 0)
			{
				if(speed_ < 0.01)
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

		vec2d direction_ = vec2d(0,0);//動いている向き
		double speed_ = 0.0;

		vec2d sight_ = vec2d(0,0);//目が向いてる方向
	}
}
