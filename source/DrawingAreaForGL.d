//This sourcecode base is GtkD example of "module simpleGL.SimpleGL" .
import ImportGtkD
class DrawingAreaForGL : DrawingArea
{
	/** need to include the mixin to add GL capabilities to this widget */
	mixin GLCapability;

	/**
	 * Construct a simple DrawingArea and sets the GLCapabilities
	 */
	this()
	{
		super(1024,800);
		setGLCapability();	// set the GL capabilities for this widget
	}

	/**
	 * put any gl initializations here
	 * returns true to consume the event
	 */
	void initGL()
	{
		resizeGL(null);
	}
	
	/**
	 * This method is called every time the window must be paint or repaint
	 * This is where you put the OpenGL call to draw something.
	 * This method call be called directly by the application without an event object
	 * to force redrawing of the scene.
	 * returns true to consume the event
	 */
	bool drawGL()
	{
		glClear (GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
		glLoadIdentity ();

		gluLookAt(0, 0, 10, 0, 0, 0, 0, 1,0); //Set the camera position

		return true;
	}

	/**
	 * This method is called when the window is resized
	 * returns true to consume the event
	 */
	real width;
	real height;
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
		
		width = w;
		height = h;
		
		glViewport (0, 0, cast(int)w, cast(int)h); //Adjust the viewport according to new window dimensions 

		/*
		 * Update the projection Matrix accoding to the new dimension
		 * and reset the OpenGL state to MODELVIEW
		 */
		glMatrixMode (GL_PROJECTION);
		glLoadIdentity ();
		gluPerspective(20, w/h, 0.1, 10);
		glMatrixMode (GL_MODELVIEW);

		return true;
	}
}
