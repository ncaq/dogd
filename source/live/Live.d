module live.Live;

public import std.math;
public import gl3n.linalg;
public import gl3n.math;
public import live.UpdateAble;
public import shape.DrawAble;

abstract class Live:DrawAble,UpdateAble//abstractの仕様がよくわからない
{
	public
	{
		@property void position(in vec3d p)//set
		{
			position_ = p;
		}

		const
		{
			@property final immutable(vec3d) position()//get
			{
				return position_;
			}
		}
	}
	
	private
	{
		vec3d position_;
	}
}
