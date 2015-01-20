private double fractionLength = .9; 
private int smallestBranch = 20; 
private double branchAngle = .4;  
public double trunkL = 10;
public void setup() 
{   
	size(640,480);
} 
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	strokeWeight(3);
	line(320,480,320,(float)(480-trunkL));   
	drawBranches(320,(int)(480-trunkL),trunkL,3*Math.PI/2, 3);
	trunkL+=0.1;
	if(trunkL>50) {trunkL=20;}
} 
public void drawBranches(int x,int y, double branchLength, double angle, double sWeight) 
{   
	double angle1=angle + branchAngle;
	double angle2=angle - branchAngle;
	branchLength*=fractionLength;
	strokeWeight((float)sWeight);
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y); 
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);
	if(branchLength>smallestBranch)
	{
		drawBranches(endX1,endY1,branchLength,angle1,sWeight/1.3);
		drawBranches(endX2,endY2,branchLength,angle2,sWeight/1.3);
	}
} 
