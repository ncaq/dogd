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
		q_ = new Quad(
			[vec3d(-1,-1,+1),
			 vec3d(+1,-1,+1),
			 vec3d(+1,-1,-1),
			 vec3d(-1,-1,-1)],
			[new Color(vec4(0.1,0.5,0.1,1)),
			 new Color(vec4(0.1,0.4,0.1,1)),
			 new Color(vec4(0.1,0.1,0.1,1)),
			 new Color(vec4(0.1,0.2,0.1,1))]
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
	}
}
