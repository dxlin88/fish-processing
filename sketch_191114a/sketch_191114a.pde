import processing.video.*;
 
Movie movie1;
Movie movie2;


void setup() {
  size(512,1920); 
  
  movie1 = new Movie(this, "1.mp4"); 
  movie2 = new Movie(this, "2.mp4");

  movie1.loop();
  
}
 
void draw() {
  

  if (movie1.available())
  {
    movie1.read();
  }
 
  
if (mousePressed){
  movie2.loop();
   if (movie2.available())
  {
    movie2.read();
  }
  image(movie2, 0, 0);
  
}
else{
  image(movie1, 0, 0);
}
}
