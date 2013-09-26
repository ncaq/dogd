//This sourcecode base is GtkD example of "module simpleGL.SimpleGL" .
import ImportGtkD;
import LineSegment;
class DrawingAreaForGL:DrawingArea
{
	mixin GLCapability;//need to include the mixin to add GL capabilities to this widget
	this()
	{
		super(1024,800);
		setGLCapability();// set the GL capabilities for this widget
	}
	void initGL()
	{
		resizeGL(null);
	}
	bool drawGL()
	{
		glClear (GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
		glLoadIdentity ();
		gluLookAt(0, 0, 10, 0, 0, 0, 0, 1,0); //Set the camera position

		LineSegment l = new LineSegment(new Point3d(0,0,0),new Point3d(0.5,0.5,0.5));
		l.draw();
		return true;
	}
	bool resizeGL(Event event = null)
	{
		real w;
		real h;
		if ( event is null || event.type != GdkEventType.CONFIGURE )
		{
			w = getWidth();
			h = getHeight();
		}
		else
		{
			w = event.configure.width;
			h = event.configure.height;
		}
		//Viewportの調整
		width = w;
		height = h;
		glViewport (0, 0, cast(int)w, cast(int)h); //Adjust the viewport according to new window dimensions 
		glMatrixMode (GL_PROJECTION);
		glLoadIdentity ();
		gluPerspective(20, w/h, 0.1, 10);
		glMatrixMode (GL_MODELVIEW);
		return true;
	}
	private
	{
		real width;
		real height;
	}

}
