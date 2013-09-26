import LineSegment;

class LineLoop
{
	this(in LineSegment[] a)
	{
		foreach(i,e;a)
		{
			lines_[i] = new LineSegment(e);
		}
	}
	const
	{
		@property const(LineSegment[]) lines()
		{
			return lines_;
		}
	}
	private
	{
		LineSegment[] lines_;
	}
}
