//This sourcecode base is GtkD example of "module simpleGL.SimpleGL" .
import ImportGtkD;
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
