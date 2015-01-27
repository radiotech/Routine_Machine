import ddf.minim.*;

Minim minim;
AudioPlayer message;

int marker = 0;
float durration;

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
  
  noFill();
  
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
    
    if(marker<durration*60){
      marker++;
    }
  }
  
  textFont(font, 70);
  textAlign(CENTER,CENTER);
  if(times > 0){
    text(words[lastPoint(marker)],width/2,height/2);
  }
  
  textFont(font, 48);
  textAlign(LEFT);
  text("Back",width/30+height/100,height/10);
  if(marker%60<10){
    text("0"+marker%60,width-width/10+height/100,height/10);
  } else {
    text(marker%60,width-width/10+height/100,height/10);
  }
  textAlign(RIGHT);
  text(floor(marker/60),width-width/10-height/100,height/10);
  textAlign(CENTER);
  text(":",width-width/10,height/10);
}
