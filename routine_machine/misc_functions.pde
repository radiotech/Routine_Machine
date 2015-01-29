void next(){
  marker = ceil(60*time[median(lastPoint(marker)+1,0,times-1)]);
}

void back(){
  marker = ceil(60*time[median(lastPoint(marker-10),0,times-1)]);
}

color get_color(int a){
  return color(reds[routineIndex][pointIndex][a],greens[routineIndex][pointIndex][a],blues[routineIndex][pointIndex][a]);
}

int median(int a, int b, int c){
  if(a>=b && a>=c){
    if(b>=c){
      return b;
    } else {
      return c;
    }
  } else if(b>=a && b>=c){
    if(a>=c){
      return a;
    } else {
      return c;
    }
  } else if(c>=a && c>=b){
    if(a>=b){
      return a;
    } else {
      return b;
    }
  }
  return 0;
}

int lastPoint(int position){
  for(int i = 0; i < times; i++){
    if(time[i]>position/60) {
      return i-1;
    }
  }
  if(times > 0){
    if(position/60>=time[times-1]){
      return times-1;
    } else {
      return 0;
    }
  } else {
    return 0;
  }
}

void set_global_scale(int a){
  global_scale = a;
  if(a == 0){
    routineIndex = 100;
    pointIndex = 100;
  }
  if(a == 1){
    pointIndex = 100;
  }
}

float text_scale(int a, int b, int c, String d){
  float text_size = 100;
    
  if(textWidth(d)/(textAscent()+textDescent())>float(a-c*2)/(b-c)){
    for(int i = 0; i < 3; i++){
      textSize(text_size);
      text_size = text_size*(a-c*2)/textWidth(d);
    }
  } else {
    for(int i = 0; i < 3; i++){
      textSize(text_size);
      text_size = text_size*(b-c)/(textAscent()+textDescent());
    }
  }
  
  
  return text_size;
}

String text_scale_str(int a, int b, int c, String d){
  text_scale( a, b, c, d);
  return d;
}

void text_group(){
  float min_size = width;
  for(int i = 0; i < text_group_length; i++){
    if(text_scale(text_group_w[i],text_group_h[i],height/25,text_group[i]) < min_size){
      min_size = text_scale(text_group_w[i],text_group_h[i],height/25,text_group[i]);
    }
  }
  textSize(min_size);
  for(int i = 0; i < text_group_length; i++){
    text(text_group[i],text_group_x[i],text_group_y[i]);
  }
}

int text_click(){
  int my_return = -1;
  for(int i = 0; i < text_group_length; i++){
    if(abs(mouseX-text_group_x[i])<text_group_w[i]/2){
      if(abs(mouseY-text_group_y[i])<text_group_h[i]/2){
        my_return = i;
      }
    }
  }
  return my_return;
}
