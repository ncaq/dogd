module live.Live;

public import live.UpdateAble;
public import shape.DrawAble;
public import gl3n.linalg;
public import gl3n.math;
public import std.math;

abstract class Live:DrawAble,UpdateAble//abstractの仕様がよくわからない
{
	public
	{
		const
		{
			@property final immutable(vec3d) position()//get
			{
				return position_;
			}
		}
		
		@property void position(in vec3d p)//set
		{
			position_ = p;
		}
	}
	
	private
	{
		vec3d position_;
	}
}
