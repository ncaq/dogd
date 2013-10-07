module shape.DrawAble;
//一気に描画するためだけに存在する
public import ImportGtkD;
interface DrawAble
{
	public
	{
		const
		{
			void draw();
			void vertex();
		}
	}
}
