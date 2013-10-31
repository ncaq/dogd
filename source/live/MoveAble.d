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
			direction_.x = atan2(i.x,-i.z);//始点に注意してください
			immutable double base = hypot(i.x,i.z);
			direction_.y = atan2(i.y,base);
			speed_ = i.length;
		}

		void yTurn(in double to,in double per=1)//toはsightに対する相対角度,y = 2π*per
			in
			{
				assert(per >= 0);
				assert(per <= 1);
			}
		body
		{
			immutable double toangle = sight_.x + to;
			immutable double difangle = toangle - direction_.x;
			//immutable double block = cradians!(360)() * per;

			if(difangle == 0)
			{
				return;
			}

			//inertia = inertia * mat3d.yrotation(difangle);
			
			///todo やっつけ あとで何とかする
			direction_.x += difangle;
			
			//todo per
			// if(std.math.abs(difangle) < block)
			// {
			// 	//direction_.x = toangle;
			// 	immutable rotate = Matrix!(double,3,3).yrotation(difangle);
			// 	inertia = inertia * rotate;
			// }
			// else
			// {
			// 	if(difangle >= 0)
			// 	{
			// 		immutable rotate = Matrix!(double,3,3).yrotation(block);
			// 		inertia = inertia * rotate;
			// 	}
			// 	else
			// 	{
			// 		immutable rotate = Matrix!(double,3,3).yrotation(-block);
			// 		inertia = inertia * rotate;
			// 	}
			// }
		}


		void turnFront()
		{
			yTurn(cradians!(0)());
		}

		void turnBack()
		{
			yTurn(cradians!(180)());
		}

		void turnLeft()
		{
			yTurn(cradians!(90)());
		}

		void turnRight()
		{
			yTurn(cradians!(270)());
		}

		void addSpeed(in double n)
		{
			speed_ += n;
		}

		void rotateSight(in vec2d angle)
		{
			sight_ += angle;
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

			@property immutable(double) speed()
			{
				return speed_;
			}
		}
	}
	
	private
	{
		final void silde()//スライド
		{
			if(speed_ != 0)
			{
				if(speed_ < 0.0001)
				{
					speed_ = 0;
				}
				else
				{
					speed_ /= 2;
					position =  position + inertia;
				}
			}
			import std.stdio;
			debug
			{
				writeln("position:",position);
				writeln("sight:",degrees(sight_.x),"%,",degrees(sight.y),"%");
				writeln("inertia:",inertia);
				writeln("speed:",speed_);
			}
		}

		vec2d direction_ = vec2d(0,0);//動いている向き
		double speed_ = 0.0;

		vec2d sight_ = vec2d(0,0);//目が向いてる方向

		alias Matrix!(double,3,3) mat3d;
	}
}

unittest
{
	debug
	{
		import live.PlayerCharacter;
		import std.stdio;
		auto c = new Camera(vec3d(0,0,0),vec2d(0,0),0);
		auto test = new PlayerCharacter(c);
		test.direction_ = vec2d(0,0);
		test.speed_ = 1;
		assert(test.inertia == vec3d(0,0,-1));
		test = new PlayerCharacter(c);
		test.inertia = vec3d(0,0,-1);
		try
		{
			assert(test.direction_ == vec2d(0,0),"evil direction");
		}
		catch(Throwable e)
		{
			writeln("raw",test.direction_);
			throw e;
		}
		assert(test.speed_ == 1,"evil speed");
	}
}
