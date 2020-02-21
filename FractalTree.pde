private double fractionLength = .8; 
private int smallestBranch = 5; 
private double branchAngle = .5;  
//private color myColor1=color(97,71,250);
private color myColor1=color(255,255,255);
private color myColor2=color(247,10,247);
private color myColor3=color(97,71,250);

private int color1=0;
public void setup() 
{   
	size(640,480);    
	//noLoop(); 
} 
public void draw() 
{   
	background(212,201,222);   
	//stroke(0,72,185);
	stroke(color1);
	strokeWeight(5);
	line(320,480,320,380);   
	drawBranches(320,380,100,3*Math.PI/2);  //will add later 

} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1=angle+branchAngle;
	double angle2=angle-branchAngle;
	branchLength=branchLength*fractionLength; //shorter length of the new branch
	int endX1=(int)(branchLength*Math.cos(angle1)+x);
	int endY1=(int)(branchLength*Math.sin(angle1)+y);
	int endX2=(int)(branchLength*Math.cos(angle2)+x);
	int endY2=(int)(branchLength*Math.sin(angle2)+y);
	line (x,y,endX1,endY1);
	line (x,y,endX2,endY2);

	if (branchLength>smallestBranch){
		strokeWeight(2);
		stroke(myColor1); 
		drawBranches (endX1,endY1,branchLength,angle1);
		stroke(myColor2);
		drawBranches (endX2,endY2,branchLength,angle2);
	}

} 
public void mouseClicked(){
	if (color1==0){
		 color1=255;
	}else{
		color1=0;
	}
}
