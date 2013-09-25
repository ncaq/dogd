//This sourcecode base is GtkD example of "module simpleGL.SimpleGL" .
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

import DrawingAreaForGL;
import Point3d;

void main(string[] args)
{
	Main.init(args);

	GLdInit.init(args);

	DrawingAreaForGL draw_area = new DrawingAreaForGL();
	MainWindow window = new MainWindow("dogd");
	window.add(draw_area);
	window.showAll();

	Main.run();
}
