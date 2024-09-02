/*
Programing: 
 Name: 
*/
PImage img;
color currentColor; 
CubedParticle[][] cp; 
int n; 
void setup()
{
  n = 300; 
  img = loadImage("windel_2.jpg");
  img.resize(width,height); 
  size(1000,1000, P3D); 
  background(100); 
  cp = new CubedParticle[n][n];
  
  for(int i = 0; i < n; i++)
  {
    for(int j = 0 ; j < n; j++)
    {
      currentColor = img.get(int(width*((1+i)/float(n))-40),int(height*((1+j)/float(n))-40)); 
    cp[i][j] = new CubedParticle(width*((1+i)/float(n))-40,height*((1+j)/float(n))-40,map(red(currentColor),0,255,-50,50), width/n,currentColor ); 
  }
  }
}

void draw() {
  background(100); 
  pushMatrix(); 
  //translate(0,sin(frameCount*0.02)*width, -width); 
  //rotateX(TWO_PI + (frameCount*0.02)); 
 // rotateY(TWO_PI + (frameCount*0.02)); 
  for(int a = 0; a  < cp.length; a++)
  {
    for(int b = 0; b < n; b++)
    {
    cp[a][b].draw(); 
    cp[a][b].update(); 
    }
  }
  popMatrix(); 
} 



void saveImage() {
  int seed = 100; 
  String timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2); 
  saveFrame(timestamp+"-"+seed+".png");
}

//int colors[] = {#FFB401, #072457, #EF4C02, #ADC7C8, #FE6567};
//int colors[] = {#07001C, #2e0091, #E2A218, #D61406};
//int colors[] = {#99002B, #EFA300, #CED1E2, #D66953, #28422E};
//int colors[] = {#A1A7F4, #EA77BA, #EA0071, #F70D04, #301156};
//int colors[] = {#FE829C, #6AFFB8, #BB6633, #3B382B, #DF9BFB};
//int colors[] = {#FE829C, #000000, #BB6633, #3B382B, #DF9BFB};
//int colors[] = {#F7DA36, #A51515, #2B1F19, #1B44C1};//, #6BEFA4};
int colors[] = {#F9F7F7, #F94D32, #500C02, #000000};//, #6BEFA4};
//int colors[] = {#FFDF2B, #B20E0E, #38251C, #1A4CAF, #1E6028};
//int colors[] = {#99002B, #CED1E2, #D66953, #28422E};
//int colors[] = {#EA2E73, #F7AA06, #1577D8};
//int colors[] = {#0F0F0F, #7C7C7C, #4C4C4C};

int rcol() {
  return colors[int(random(colors.length))];
}

int getColor() {
  return getColor(random(colors.length));
}

int getColor(float v) {
  v = abs(v); 
  v = v%(colors.length); 
  int c1 = colors[int(v%colors.length)]; 
  int c2 = colors[int((v+1)%colors.length)]; 
  return lerpColor(c1, c2, pow(v%1, 0.1));
} 
