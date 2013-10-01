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
			glVertex3dv(front.vector);
			glVertex3dv(back.vector);
		}
		void vertexFront()
		{
			glVertex3dv(front.vector);
		}
	}
}
