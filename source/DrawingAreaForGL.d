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
import LineLoop;
import Point3d;
import FaceTriangle;

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
		glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
		glLoadIdentity ();
		gluLookAt(0, 0, 10, 0, 0, 0, 0, 1,0); //Set the camera position

		//test code
		auto tri = new FaceTriangle([new Point3d(0,0,0),new Point3d(1,0.5,1),new Point3d(0,1,0)]);
		tri.draw();
		return true;
	}

	bool resizeGL(Event event = null)
	{
		if(event !is null)
		{
			width = event.configure.width;
			height = event.configure.height;
		}
		glViewport (0, 0, cast(int)width, cast(int)height); //Adjust the viewport according to new window dimensions 
		glMatrixMode (GL_PROJECTION);
		glLoadIdentity ();
		gluPerspective(20, width/height, 0.1, 10);
		glMatrixMode (GL_MODELVIEW);
		return true;
	}

	private
	{
		double width;
		double height;
	}
}
