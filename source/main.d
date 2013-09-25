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

void main(string[] args)
{
	Main.init(args);

	GLdInit.init(args);
	
	UserGL userGL = new UserGL();
	MainWindow window = new MainWindow("Simplest OpenGL Example");
	window.add(userGL);
	window.showAll();
		
	Main.run();
}
