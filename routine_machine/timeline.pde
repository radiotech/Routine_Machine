boolean show_timeline = false;
boolean show_text = true;

void update_timeline(){
  stroke(get_color(0));
  strokeWeight(height/250);
  if(show_text == true){
    
    line(height/25*1.5-1,height-height/25*1.5-height/6*2-height/50,height/25*1.5-1,height-height/25*1.5-height/6*2);
    line(width-height/25*1.5+1,height-height/25*1.5-height/50,width-height/25*1.5+1,height-height/25*1.5);
    
    line(height/25*1.5,height-height/25*1.5-height/6*2,width-4,height-height/25*1.5-height/6*2);
    line(3,height-height/25*1.5-height/6,width-4,height-height/25*1.5-height/6);
    line(3,height-height/25*1.5,width-height/25*1.5,height-height/25*1.5);
    //line(height/25+float(marker)/60*(width-height/25*2)/durration,height-height/25*.75,height/25+float(marker)/60*(width-height/25*2)/durration,height-height/25*1.25);
    
    noStroke();
    fill(get_color(0));
    
    int duration = 50;
    float temp_x;
    float temp_y;
    for(int i = 0; i <= duration; i+=5){
      temp_y = height-height/25*1.5-height/6*2;
      temp_x = i * (width*3-(height/25)*3) / duration + (height/25)*1.5;
      
      if(temp_x>width){
        temp_x -= width;
        temp_y += height/6;
        if(temp_x>width){
          temp_x -= width;
          temp_y += height/6;
        }
      }
      
      text(text_scale_str(width/10,int((height/25)*1.5),(height/100),str(i)),temp_x,temp_y+(height/25)*1.5/2);
    }
    
    for(int i = 0; i < times; i++){
      ellipse(height/25+time[i]*(width-height/25*2)/durration,height-height/25,height/100,height/100);
    }
    
    if(times > 0){
      if(marker<time[times-1]*60){
        rect(height/25,height-height/25*2.5,(marker-time[lastPoint(marker)]*60)*(width-height/25*2)/(time[lastPoint(marker)+1]*60-time[lastPoint(marker)]*60),height/25/2);
      }
    }
    
  } else {
    
    line(height/25-1,height-height/25-height/50,height/25-1,height-height/25+height/50);
    line(width-height/25+1,height-height/25-height/50,width-height/25+1,height-height/25+height/50);
    
    line(height/25,height-height/25,width-height/25,height-height/25);
    line(height/25+float(marker)/60*(width-height/25*2)/durration,height-height/25*.75,height/25+float(marker)/60*(width-height/25*2)/durration,height-height/25*1.25);
    
    
    noStroke();
    fill(get_color(0));
    for(int i = 0; i < times; i++){
      ellipse(height/25+time[i]*(width-height/25*2)/durration,height-height/25,height/100,height/100);
    }
    
    if(times > 0){
      if(marker<time[times-1]*60){
        rect(height/25,height-height/25*2.5,(marker-time[lastPoint(marker)]*60)*(width-height/25*2)/(time[lastPoint(marker)+1]*60-time[lastPoint(marker)]*60),height/25/2);
      }
    }
  }
}
