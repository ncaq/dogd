import ImportGtkD;
import Connect2Point;
import DrawAble;
class LineSegment:Connect2Point,DrawAble
{
	this(in Point3d ifront,in Point3d iback)
	{
		super(ifront,iback);
	}
	this(in LineSegment n)
	{
		super(n);
	}
	override void draw()
	{
		glBegin(GL_LINES);
		vertex();
		glEnd();
	}
	override void vertex()
	{
		glColor3f(0.0f,0.0f,1.0f);//todo delete and set
		glVertex3f(front.x,front.y,front.z);
		glVertex3f(back.x,back.y,back.z);
	}
	void vertexFront()
	{
		glVertex3f(front.x,front.y,front.z);
	}
}
