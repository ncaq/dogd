import ImportGtkD;
import FaceTriangle;
import std.stdio;//debug

class GLDrawArea:MainWindow
{
	mixin GLCapability;//テンプレートを書き込む.特殊化はない.コピペと同義.

	this()
	{
		//GLCapabilityに定義されているのを覆い隠す
		int width = 1000;
		int height = 800;

		//super(cast(int)width,cast(int)height);
		super("dogd");
		setDefaultSize(width,height);
		setGLCapability();//テンプレートだからコンストラクタがないので,こちらから明示的に読んで初期化する必要がある.

		this.addOnKeyPress(&keyHandler);

		showAll();
	}

	void initGL()
	{
		resizeGL(null);
	}

	bool drawGL()
	{
		glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
		glLoadIdentity ();
		gluLookAt(0,0,0,
			  0,0,1,
			  0,1,0); //Set the camera position

		//test code
		auto tri = new FaceTriangle([new Point3d(0,0,1),new Point3d(1,0,1),new Point3d(0,0.5,1)]);
		tri.draw();

		glFlush();

		return true;
	}

	bool resizeGL(Event event=null)
	{
		if(event !is null)
		{
			width = event.configure().width;
			height = event.configure().height;
		}
		glViewport(0,0,cast(int)width,cast(int)height); //Adjust the viewport according to new window dimensions 

		glMatrixMode(GL_PROJECTION);
		glLoadIdentity();
		gluPerspective(20,width/height,0.1,10);

		return true;
	}

	bool keyHandler(Event e,Widget w)
	{
		//todo
		//this test code
		writeln("key event catch");
		GdkEventKey* key_event = e.key();
		writefln("sender %s", w);

		writefln("type %x",key_event.type);
		writefln("window* %x",key_event.window);
		writefln("send_key_eventent %x",key_event.sendEvent);
		writefln("time %x",key_event.time);
		writefln("state %x",key_event.state);
		writefln("keyval %x",key_event.keyval);
		writefln("length %x",key_event.length);
		writefln("gchar* %x",key_event.string);
		writefln("hardware_keycode %x",key_event.hardwareKeycode);
		writefln("group %x",key_event.group);
		writefln("is_modifier %x\n",key_event.bitfield0);

		return true;
	}
	
	private
	{
	}
}
