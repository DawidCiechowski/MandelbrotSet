void setup() {
  size(600, 400);
  colorMode(RGB, 1);
}

void draw() {
 background(255);
 float w = 5;
 float h = (w * height)/width;
 
 float xmin = -w/2;
 float ymin = -h/2;
 
 loadPixels();
 
 int maxIterations = 100;
 float xmax = xmin + w;
 float ymax = ymin + w;
 
 float dx = (xmax - xmin)/width;
 float dy = (ymax - ymin)/height;
 
 float y = ymin;
 for(int j = 0; j < height; j++) {
   float x = xmin;
   for(int i = 0; i < width; i++) {
     float a = x;
     float b = y;
     int n = 0;
     
     while(n < maxIterations) {
      float aa = a * a;
      float bb = b * b;
      float twoAB = 2.0 * a * b;
      
      a = aa - bb + x;
      b = twoAB + y;
      
      if(a*a + b*b > 16) {
        break;
      }
      n++;
     }
     
     if(n==maxIterations) {
       pixels[i+j*width] = color(180, 255, 156, 1000);
     } else {
       pixels[i+j*width] = color(sqrt(float(n)) / maxIterations);
     }
     
     x += dx;
   }
   y += dy;
 }
 
 updatePixels();
 println(frameRate);
}