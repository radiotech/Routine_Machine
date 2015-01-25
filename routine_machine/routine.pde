import ddf.minim.*;

Minim minim;
AudioPlayer message;

int marker = 0;
float durration;
int times = 15;
float time[] = new float[times];
String words[] = new String[times];
int change = -1;
int repeat = -1;

boolean show_routine;
int routineIndex;

int last_mill = 0;

void set_routine(int a){
  routineIndex = a;
  show_routine = true;
  last_mill = millis();
}

void update_routine(){
  
  background(0);

  noFill();
  stroke(255);
  strokeWeight(pad/10);
  
  if(last_mill+1000 <= millis()){
    last_mill += 1000;
    
    if(lastPoint(marker) != change){
      change = lastPoint(marker);
      repeat = 10;
    }
    
    if(repeat > -1){
      repeat-=1;
      if(repeat == 10 || repeat == 5 || repeat == 0){
        //message = minim.loadFile("http://radiotech.github.io/Morning/morning_program/data/"+change+".mp3");
        //message.play();
        //play alert message
      }
    }
    
    /*
    if(marker==-1){
      frameRate(30);
    }
    */
    
    if(marker<durration*60){
      marker++;
    }
  }
  
  line(pad,height-pad,width-pad,height-pad);
  line(pad+float(marker)/60*(width-pad*2)/durration,height-pad*.75,pad+float(marker)/60*(width-pad*2)/durration,height-pad*1.25);
  noStroke();
  fill(255);
  
  for(int i = 0; i < times; i++){
    ellipse(pad+time[i]*(width-pad*2)/durration,height-pad,pad/4,pad/4);
  }
  
  if(marker<time[times-1]*60){
    rect(pad,height-pad*2.5,(marker-time[lastPoint(marker)]*60)*(width-pad*2)/(time[lastPoint(marker)+1]*60-time[lastPoint(marker)]*60),pad/2);
  }
  
  textFont(font, 70);
  textAlign(CENTER,CENTER);
  text(words[lastPoint(marker)],width/2,height/2);
  
  textFont(font, 48);
  textAlign(LEFT);
  text("Back",width/30+pad/4,height/10);
  if(marker%60<10){
    text("0"+marker%60,width-width/10+pad/4,height/10);
  } else {
    text(marker%60,width-width/10+pad/4,height/10);
  }
  textAlign(RIGHT);
  text(floor(marker/60),width-width/10-pad/4,height/10);
  textAlign(CENTER);
  text(":",width-width/10,height/10);
}
