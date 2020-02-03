void setup()
{
	size(600,600);
	background(0);
}
void draw()
{
	background(0);
	myFractal(255,300,30);
}
public void myFractal(float x, float y, float siz)
{
	int r,g,b;
	r = (int)(Math.random()*255);
	g = (int)(Math.random()*255);
	b = (int)(Math.random()*255);
	fill(r,g,b);
	stroke(r,g,b);
	textSize(siz);
	text("uwu",x,y);
	if(siz>10)
	{
		myFractal(x+siz*4.5,y+siz*4.5,siz*.7);
		myFractal(x+siz*4.5,y-siz*4.5,siz*.7);
		myFractal(x-siz*4.5,y+siz*4.5,siz*.7);
		myFractal(x-siz*4.5,y-siz*4.5,siz*.7);
	}
}