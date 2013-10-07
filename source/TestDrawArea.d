import ImportGtkD;
import std.stdio;//debug

class TestDrawArea:DrawingArea
{
	this()
	{
		//GLCapabilityに定義されている
		immutable width = 1000;
		immutable height = 800;

		super(cast(int)width,cast(int)height);

		this.addOnKeyPress(&keyHandler);

		showAll();

		writeln(onKeyPressListeners);
	}

	void initGL()
	{
		resizeGL(null);
	}

	bool drawGL()
	{
		return true;
	}

	bool resizeGL(Event event=null)
	{
		return true;
	}

	bool keyHandler(Event e,Widget w)
	{
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
