module main;
//This sourcecode base is GtkD example of "module simpleGL.SimpleGL" .
import ImportGtkD;
import GLDrawArea;

void main(string[] args)
{
	Main.init(args);
	GLdInit.init(args);

	auto draw_area = new GLDrawArea();

	Main.run();
}
