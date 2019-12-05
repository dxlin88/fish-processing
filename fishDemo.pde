int action;
int inital=0;
long CurTime,CurTime1;
long PreTime,PreTime1;
long OutInterval=2000;
long InInterval=2000;

void draw() {
  CurTime=millis();
  
  if (action==0 & inital==0) {
    fill(255);                            //start
    rect (25, 25, 50, 50);
    PreTime = CurTime;
   // println("Start=",CurTime);
  
} else if(CurTime-PreTime<=OutInterval){
    fill(0,255,0);                            //out
    rect(25, 25, 50, 50);
    //println("P=",PreTime);
    inital=1;
  } else if(action==1 &inital==1){                               //clean
     fill(255,0,0);
     rect(25,25,50,50);
    // println("clean=",CurTime);
  PreTime1=CurTime;
  }else if(action==0 & inital==1){
     if(CurTime-PreTime1 <= InInterval){
     fill(0);
     rect(25,25,50,50);
     }else{
     inital=0;
     }
   }
  print("C=",CurTime);
  print("  P1=",PreTime);
  println("  p=",PreTime1);
}

void mousePressed() {
  action=1;
  //println(CurTime);
}
void mouseReleased() {
  action=0;
}
