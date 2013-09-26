import ImportGtkD;
public import Connect2Point;
class LineSegment:Connect2Point
{
	this(in Point3d ifront,in Point3d iback)
	{
		super(ifront,iback);
	}
	this(in LineSegment n)
	{
		super(n);
	}
	void draw()
	{
		glBegin(GL_LINES);
		glColor3f(0.0f,0.0f,1.0f);
		glVertex3f(front.x,front.y,front.z);
		glVertex3f(back.x,back.y,back.z);
		glEnd();
	}
}
