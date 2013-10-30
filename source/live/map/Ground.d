module live.map.Ground;

import gl3n.linalg;
import gl3n.math;
import shape.DrawAble;
import shape.Quad;
import shape.Color;

class Ground:DrawAble
{
	this()
	{
		min_ = -1;
		max_ = +1;
		q_ = new Quad(
			[vec3d(min_,min_,max_),
			 vec3d(max_,min_,max_),
			 vec3d(max_,min_,min_),
			 vec3d(min_,min_,min_)],
			[new Color(greenbase_),
			 new Color(greenbase_),
			 new Color(greenbase_),
			 new Color(greenbase_ + vec4(0,0.1,0,0))]
			);
	}
	
	override void draw()
	{
		glPushMatrix();
		q_.draw();
		glPopMatrix();
	}
	
	private
	{
		Quad q_;
		double min_,max_;
		static immutable vec4 greenbase_ = vec4d(0.000,0.392,0.000,1);
	}
}

