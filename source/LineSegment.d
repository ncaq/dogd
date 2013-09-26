import ImportGtkD;
import Connect2Point;
import CanDrawObject;
class LineSegment:Connect2Point,CanDrawObject
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
		glColor3f(0.0f,0.0f,1.0f);
		glVertex3f(front.x,front.y,front.z);
		glVertex3f(back.x,back.y,back.z);
		glEnd();
	}
}
