/**
 * Interactiv Fish 
 * 
 * Screen  512*1920
 * 
 * Start()
 *   1.Loop paly MovieStart 36S.,MovieStart have 18 section, Section 2S.per section.
 * 
 * Action()
 *   1. Detect sensor 1ps,if have action;
 *   2. Play MovieFishAway n (n=MovieStart section) 2S.;
 *   3. Loop play MovieClean and detect sensor action. 
 * No Action()
 *   1. Detect sensor 1ps,if have no action;
 *   2. Loop play MovieClean 10S.;
 *   3. Play MovieBack to end;
 *   4. Goback to MovieStart.
 */

import processing.video.*;

Movie MovieStart;
Movie MovieAway;
Movie MovieClean;
Movie MovieBack;
int action=0;
int inital=0;
int cut=0, cuttime;

void setup() {
  size(210, 640);
  background(0);
  // Load and play the video in a loop
  MovieStart = new Movie(this, "MovieStart.mp4");
  MovieAway =new Movie(this, "FishOut.mp4");
  MovieClean =new Movie(this, "MovieClean.mp4");
  MovieBack =new Movie(this, "MovieFishBack1.mp4");
  MovieStart.loop();
  //MovieFishAway.jump(0);
  MovieAway.loop();
  MovieClean.loop();
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {

  if (action==0 & inital==0) {                        // a=0,ini=0    inital loop play MovieStart.mp4
    image(MovieStart, 0, 0, width, height);
  } else if (cut==1 & MovieAway.time()<cuttime+2) { 
    //action=0;                                       // act=1,ini=0  have action play MovieFishAway.mp4
    inital=1;
    //MovieAway.play();                                 
    image(MovieAway, 0, 0, width, height);  
    //if ()
  }else{  
      image(MovieClean, 0, 0, width, height);          //and then loop play MovieClean.mp4
      //println("MovieClean = "+MovieClean.time());
      if (action==0 & inital==1) {                     //act=0,act=1 
        MovieBack.play();
        image(MovieBack, 0, 0, width, height);
        if (MovieBack.time()>MovieClean.duration()-0.1) {
          action=0;
          inital=0;
          cut=0;
          // MovieAway.stop();
          // MovieAway.jump(0);
          MovieBack.stop();
          MovieBack.jump(0);
        }
        //MovieStart.loop();
      
    }
  }

  if (MovieStart.time() < (int(MovieStart.time()/2)*2+0.03) & MovieStart.time() > int(MovieStart.time()/2)*2)
  { //println(int(MovieStart.time()/2)*2);
    // println();
    cuttime=int((MovieStart.time()/2)*2);
    cut=1;
    println(cuttime);
  }
 // else cut=0;
  print("action="+action+"   inital="+inital+"   cut="+cut);
  print("    MovieStartTime = "+MovieStart.time()+"   MovieAwayTime = "+MovieAway.time());
  println(" MovieClean = "+MovieClean.time(), "   MovieBackTime="+MovieBack.time());
}

void keyPressed() {
  if (keyCode == 32 ) {
    if (action==1) {
      action=0;
    } else   action=1;
  }
} 
