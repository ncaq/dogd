import gdk.Event;
import gtk.DrawingArea;
import gtk.Main;
import gtk.MainWindow;
import gtk.Widget;
import glgdk.GLConfig;
import glgdk.GLContext;
import glgdk.GLdInit;
import glgdk.GLWindow;
import glgtk.GLCapability;
import gtkglc.glgdktypes;
import gtkglc.gl;
import gtkglc.glu;

import Connect2Point;
class LineSegment : Connect2Point
{
	this(in Point3d ifront,in Point3d iback)
	{
		super(ifront,iback);
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
