module shape.LineSegment;
import shinh.opengl;
import shape.ConnectPoint2;
import shape.DrawAble;
class LineSegment:ConnectPoint2
{
	this(in vec3 ifront,in vec3 iback)
	{
		super(ifront,iback);
	}
	this(in LineSegment n)
	{
		super(n);
	}
	const
	{
		override void draw()
		{
			glBegin(GL_LINES);
			vertex();
			glEnd();
		}
		override void vertex()
		{
			glColor3d(0.0f,0.0f,1.0f);//todo delete and set
			glVertex3f(front.x,front.y,front.z);
			glVertex3f(back.x,back.y,back.z);
		}
		void vertexFront()
		{
			glVertex3f(front.x,front.y,front.z);
		}
	}
}
