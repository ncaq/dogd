module live.HitAble;

public import live.MoveAble;
public import std.typecons;

abstract class HitAble:MoveAble
{
	public
	{
		this(in vec3d pos,in vec3d wide,in vec3d height,in vec3d depth)
		{
			super(pos);

			wide_ = wide;
			height_ = height;
			depth_ = depth;
		}

		immutable double accuracy = 0.001;
		
		// vec3d[] aboutVertex()
		// {
		// 	immutable xr = xRange();
		// 	immutable yr = yRange();
		// 	immutable zr = zRange();

		// 	for(double x=xr[0];;)
		// 	{
		// 	}
		// }

		immutable(Tuple!(immutable(vec3d),immutable(vec3d))) helpRange(vec3d distance)
		{
			immutable puremin = position - distance;
			immutable puremax = position + distance;
			immutable yspin = mat3d.yrotation(direction_.x);
			immutable yspinmin = puremin * yspin;
			immutable yspinmax = puremax * yspin;
			immutable xzaxis = puremax * mat3d.yrotation(cradians!(90)());
			immutable xzspin = mat3d.rotation(direction_.y,xzaxis);
			immutable resumemin = yspinmin * xzspin;
			immutable resumemax = yspinmax * xzspin;
			return tuple(resumemin,resumemax);
		}

		@property immutable(Tuple!(immutable(vec3d),immutable(vec3d))) xRange()
		{
			return helpRange(wide_);
		}

		@property immutable(Tuple!(immutable(vec3d),immutable(vec3d))) yRange()
		{
			return helpRange(height_);
		}

		@property immutable(Tuple!(immutable(vec3d),immutable(vec3d))) zRange()
		{
			return helpRange(depth_);
		}

	}
	
	private
	{
		vec3d wide_,height_,depth_;
	}
}

import std.stdio;

double dround(in double target,in double acc)
{
	immutable long digit = cast(long)(log10(acc));
	immutable long wide = cast(long)(pow(10.0,-digit)) * 10;
	long up = cast(long) ((target * wide) + 0.5);

	debug
	{
		writeln("target:",target);
		writeln("acc:",acc);
		writeln("digit:",digit);
		writeln("wide:",wide);
		writeln("up:",up);
	}
	return cast(double)(cast(double)up / wide);
}

unittest
{
	assert(dround(0.00111111,0.001) == 0.001);
	assert(dround(0.10443,0.001) == 0.104);
	assert(dround(13.345,0.01) == 13.35);
}
