boolean spin = false;
boolean crazy = false;
void setup()
{
	frameRate(30);
	size(600,600);
	background(0);
}
void draw()
{
	background(0);
	if(crazy&&frameCount%3==0){
		spin=!spin;
	}
	if(spin)
	{
		pushMatrix();
		translate(255,300);
		rotate((float)Math.random()*2*PI);
		myFractal(0,0,30);
		popMatrix();
		textSize(20);
		fill(255,255,255);
		text("SPINNING UWU FRACTAL",275,75);
	}
	else
	{
		myFractal(255,300,30);
		textSize(20);
		fill(255,255,255);
		text("NORMAL UWU FRACTAL",265,75);
	}
}
void keyPressed()
{
	if(key=='s'||key=='S')
		spin=!spin;
	if(key=='c'||key=='C')
		crazy=!crazy;
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
	if(siz>20)
	{
		myFractal(x+siz*4.5,y+siz*4.5,siz*.7);
		myFractal(x+siz*4.5,y-siz*4.5,siz*.7);
		myFractal(x-siz*4.5,y+siz*4.5,siz*.7);
		myFractal(x-siz*4.5,y-siz*4.5,siz*.7);
	}
}