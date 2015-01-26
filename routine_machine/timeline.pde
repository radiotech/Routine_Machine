boolean show_timeline = false;
boolean show_text = true;

void update_timeline(){
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
