boolean show_timeline = false;
boolean show_text = true;

void update_timeline(){
  stroke(get_color(0));
  strokeWeight(line);
  if(show_text == true){
    
    line(height/25*1.5-1,height-height/25*1.5-height/6*2-height/50,height/25*1.5-1,height-height/25*1.5-height/6*2);
    line(width-height/25*1.5+1,height-height/25*1.5-height/50,width-height/25*1.5+1,height-height/25*1.5);
    
    line(height/25*1.5,height-height/25*1.5-height/6*2,width-4,height-height/25*1.5-height/6*2);
    line(3,height-height/25*1.5-height/6,width-4,height-height/25*1.5-height/6);
    line(3,height-height/25*1.5,width-height/25*1.5,height-height/25*1.5);
    //line(height/25+float(marker)/60*(width-height/25*2)/durration,height-height/25*.75,height/25+float(marker)/60*(width-height/25*2)/durration,height-height/25*1.25);
    
    noStroke();
    fill(get_color(0));
    
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
      
      text(text_scale_str(width/10,int((height/25)*1.5),(height/100),str(i)),median(round(temp_x),round(textWidth("999")/2),round(width-textWidth("999")/2)),temp_y+(height/25)*1.5/2);
    }
    
    float[][] tempPos = new float[3][2]; 
    tempPos[2][0] = width;
    tempPos[2][1] = -2;
    for(int i = 0; i < points[routineIndex]; i++){
      if(i+1 <= points[routineIndex]){
        tempPos[0] = time_to_bigline(procedure_time[routineIndex][i+1]);
      } else {
        tempPos[0][0] = width;
        tempPos[0][1] = -1;
      }
      if(i == 0){
        tempPos[1] = time_to_bigline(procedure_time[routineIndex][i]);
        
        /*
        
        println(tempPos[0]);
        println(tempPos[1]);
        println(tempPos[2]);
        */
        //println(points[routineIndex]);
      }
      if(points[routineIndex] == 1){
        tempPos[0][0] = width;
        tempPos[0][1] = -1;
      }
      
      //stroke(5);
      //strokeWeight(4);
      float minWidth = width;
      if(tempPos[2][1] == tempPos[1][1]){
        minWidth = abs(tempPos[2][0] - tempPos[1][0])/2;
      }
      if(tempPos[0][1] == tempPos[1][1]){
        minWidth = min(abs(tempPos[0][0] - tempPos[1][0])/2,minWidth);
      }
      //line(tempPos[1][0]-minWidth,tempPos[1][1]+10,tempPos[1][0]+minWidth,tempPos[1][1]+10);
      
      
      if(point_mode == 0){
        
        noStroke();
        fill(get_color(0));
        if(pointIndex == i){
          fill(get_color(2));
        }
        
        ellipse(tempPos[1][0],tempPos[1][1],height/50,height/50);
        
      } else {
        
        noFill();
        strokeWeight(max(height/500,1));
        stroke(get_color(0));
        if(pointIndex == i){
          stroke(get_color(2));
        }
        
        float tempX = tempPos[1][0];
        float tempY = tempPos[1][1];
        tempY -= height/2+height/6;
        for(int k = 0; k < 3; k++){
          if(tempY > 0){
            tempY -= height/6;
            tempX+= width;
          }
        }
        if(points[routineIndex]>i+1){
          tempY = raw_time_to_bigline(procedure_time[routineIndex][i+1]-procedure_time[routineIndex][i]);
        } else {
          tempY = raw_time_to_bigline(duration-procedure_time[routineIndex][i]);
        }
        rect(tempX,height/2+height/6-height/25*1.5-height/50,tempY,height/25);
        rect(tempX-width,height/2+height/6-height/25*1.5-height/50+height/6,tempY,height/25);
        rect(tempX-width*2,height/2+height/6-height/25*1.5-height/50+height/6*2,tempY,height/25);
      }
      
      fill(get_color(0));
      if(pointIndex == i){
        fill(get_color(2));
      }
      text(text_scale_str(floor(minWidth)*2,int((height/25)*1.5),(height/100),procedure_words[routineIndex][i]+i),median(round(tempPos[1][0]),round(textWidth(procedure_words[routineIndex][i])/2+height/25),round(width-textWidth(procedure_words[routineIndex][i])/2+height/25)),tempPos[1][1]-(height/6-(height/25))/2);
      tempPos[2] = tempPos[1];
      tempPos[1] = tempPos[0];
    }
    
    for(int i = 0; i < times; i++){
      ellipse(height/25+time[i]*(width-height/25*2)/duration,height-height/25,height/100,height/100);
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
    line(height/25+float(marker)/60*(width-height/25*2)/duration,height-height/25*.75,height/25+float(marker)/60*(width-height/25*2)/duration,height-height/25*1.25);
    
    
    noStroke();
    fill(get_color(0));
    for(int i = 0; i < times; i++){
      ellipse(height/25+time[i]*(width-height/25*2)/duration,height-height/25,height/100,height/100);
    }
    
    if(times > 0){
      if(marker<time[times-1]*60){
        rect(height/25,height-height/25*2.5,(marker-time[lastPoint(marker)]*60)*(width-height/25*2)/(time[lastPoint(marker)+1]*60-time[lastPoint(marker)]*60),height/25/2);
      }
    }
  }
}

float bigline_to_time(float a, float b){
  b-=height/2;
  b/=(height/2)/3;
  return median(0,(floor(b)*width+a-(height/25*1.5))*float(duration)/(width*3-height/25*3),duration);
}

float raw_bigline_to_time(float a){
  return median(0,a*float(duration)/(width*3-height/25*3),duration);
}

float[] time_to_bigline(float a){
  float temp_y = height-height/25*1.5-height/6*2;
  float temp_x = a * (width*3-(height/25)*3) / duration + (height/25)*1.5;
  
  if(temp_x>width){
    temp_x -= width;
    temp_y += height/6;
    if(temp_x>width){
      temp_x -= width;
      temp_y += height/6;
    }
  }
  
  float[] temp = new float[2];
  temp[0] = temp_x; 
  temp[1] = temp_y;
  return temp;
}

float raw_time_to_bigline(float a){
  return a * (width*3-(height/25)*3) / duration;
}

float clean_time(float a){
  return float(round(a*10))/10;
}
