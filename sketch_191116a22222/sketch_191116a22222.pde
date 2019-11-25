import processing.video.*;
 
Movie movie1; 
Movie movie2; 
float start_t, end_t;
 float x = 0.0;
void setup() {
  size(512,1920); 
 
  movie1 = new Movie(this, "1.mp4"); 
  movie2 = new Movie(this, "2.mp4");
 
  movie1.loop();
  movie2.loop();
}
  void movieEvent(Movie movie2) {
  movie2.read();
}

void draw() {
  if (mousePressed){
       //float md = movie2.duration();
    //start_t = md * x;
    //end_t = md * (x+1/18);
    //println("start time: ", start_t);
    //println("end time", end_t);
    for(int x=0;x<=36;x+=2){
      
      println("start time: ", x);
    println("end time", x+2);
   
    movie2_loop(x,x+2);
    image(movie2, 0, 0);
    delay(200);
    
  if(x==36){
    movie2.jump(0);
  }
  
  }
    
  }
  else{
   if (movie1.available())
  {
    movie1.read();
  } 
  image(movie1, 0, 0); 
  }
 
  }

// loop movie from start_time to end_time
void movie2_loop(float start_time, float end_time)
{
    // get the value of current time
    float mt = movie2.time();
    println("current time: ", mt);
    if (mt < start_time || mt > end_time)
    {
      movie2.jump(start_time);
    }
}
