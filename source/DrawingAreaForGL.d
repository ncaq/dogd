//This sourcecode base is GtkD example of "module simpleGL.SimpleGL" .
//This sourcecode license is GPLv3
//upward is orginal license
/*
 * This file is part of gtkD.
 * 
 * dui is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 * 
 * dui is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with dui; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */
import ImportGtkD;
import LineSegment;
import Point3d;
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
