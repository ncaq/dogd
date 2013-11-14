module live.HitAble;

public import live.MoveAble;
public import std.typecons;
import std.algorithm;

abstract class HitAble:MoveAble
{
	public
	{
		this(in vec3d pos,in double r,ref LiveManager l)
		{
			super(pos,l);

			r_ = r;
		}
	}

	protected
	{
		double r_;
	}
}

bool isHit(in HitAble a,in HitAble b)
{
	return (distance(a.position,b.position) < a.r_ + b.r_);
}

pure double dround(in double source,in double acc)
{
	immutable long digit = cast(long)(log10(acc));
	immutable long wide = cast(long)(pow(10.0,-digit)) * 10;
	long up = cast(long) ((source * wide) + 0.5);

	return cast(double)(cast(double)up / wide);
}

unittest
{
	assert(dround(0.00111111,0.001) == 0.001);
	assert(dround(0.10443,0.001) == 0.104);
	assert(dround(13.345,0.01) == 13.35);
}
