boolean spin = false;
boolean crazy = false;
boolean down = false;
float zoom;
void setup()
{
	frameRate(30);
	size(600,600,P3D);
	background(0);
	zoom = (height/2.0) / tan(PI*30.0 / 180.0);
}
void draw()
{
	background(200);
	stroke(0);
	fill(0);
	rect(0,0,height,width);
	if(crazy&&frameCount%3==0){
		spin=!spin;
	}
	if(crazy){
		if(zoom>=1000) down = true;
		if(zoom<(height/2.0) / tan(PI*30.0 / 180.0)-200) down = false;
		zoom = down ? zoom-28 : zoom+28;
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
	camera(300,300,zoom,300,300,0,0,1,0);
}
void keyPressed()
{
	if(key=='s'||key=='S')
		spin=!spin;
	if(key=='c'||key=='C'){
		if(crazy){
			zoom = height/2.0 / tan(PI*30/180.0);
			spin = false;
		}
		crazy=!crazy;
	}
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