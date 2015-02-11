void next(){
  marker = ceil(60*time[round(median(lastPoint(marker)+1,0,times-1))]);
}

void back(){
  marker = ceil(60*time[round(median(lastPoint(marker-10),0,times-1))]);
}

color get_color(int a){
  if(reds[routineIndex][pointIndex][3] == 0){
    if(reds[routineIndex][100][3] == 0){
      return color(reds[100][100][a],greens[100][100][a],blues[100][100][a]);
    } else {
      return color(reds[routineIndex][100][a],greens[routineIndex][100][a],blues[routineIndex][100][a]);
    }
  } else {
    return color(reds[routineIndex][pointIndex][a],greens[routineIndex][pointIndex][a],blues[routineIndex][pointIndex][a]);
  }
}

void pad_duration(int a, boolean b){
  if(points[routineIndex] > 0){
    if(b){
      duration = floor(procedure_time[routineIndex][points[routineIndex]-1]+a);
    } else {
      duration = max(floor(procedure_time[routineIndex][points[routineIndex]-1]+a),duration);
    }
  } else {
    if(b){
      duration = a;
    } else {
      duration = max(a,duration);
    }
  }
}

void order_points(){
  float temp_procedure_time[] = new float[100];
  String temp_procedure_words[] = new String[100];
  int k = 0;
  int newPointIndex = 0;
  
  for(int i = 0; i < duration*10; i++){
    for(int j = 0; j < points[routineIndex]; j++){
      if(round(procedure_time[routineIndex][j]*10) == i){
        if(pointIndex == j){
          newPointIndex = k;
        }
        temp_procedure_time[k] = procedure_time[routineIndex][j];
        temp_procedure_words[k] = procedure_words[routineIndex][j];
        k++;
      }
    }
  }
  
  pointIndex = newPointIndex;
  arrayCopy(temp_procedure_time,procedure_time[routineIndex]);
  arrayCopy(temp_procedure_words,procedure_words[routineIndex]);
}

/*
void order_points_on_the_thing_with_the_lines_and_the_rainbow_flying_cat(){
░░float temp_procedure_time[] = new float[100];
░░String temp_procedure_words[] = new String[100];
░░int k = 0;
░░int newPointIndex = 0;
░░newPointIndex = k;
░░int text_click(){
░░int my_return = -1;
░░for(int i = 0; i < duration*10; i++){
░░░░░░for(int j = 0; j < points[routineIndex]; j++){
░░░░░░░░░░if(round(procedure_time[routineIndex][j]*10) == i){
░░░░░░░░░░░░░░if(pointIndex == j){
░░░░░░░░░░░░░░░░░░for(int i = 0; i < text_group_length; i++){
░░░░░░░░░░░░░░░░░░░░░░if(abs(mouseX-text_group_x[i])<text_group_w[i]/2){
░░░░░░░░░░░░░░░░░░░░░░░░░░if(abs(mouseY-text_group_y[i])<text_group_h[i]/2){
░░░░░░░░░░▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄for(int k = points[routineIndex]-1; k >= 0; k--){
░░░░░░░░▄▀░░░░░░░░░░░░▄░░░░░░░▀▄░░if(procedure_time[routineIndex][k] > a){
░░░░░░░░█░░▄░░░░▄░░░░░░░░░░░░░░█░░░░░░if(slider_pos < (-(button_height)*(menus[menuIndex])+float((height*4/5)))){
░░░░░░░░█░░░░░░░░░░░░▄█▄▄░░▄░░░█░▄▄▄░░░░░░if(marker<duration*60){
░▄▄▄▄▄░░█░░░░░░▀░░░░▀█░░▀▄░░░░░█▀▀░██░░░░░░░░░if(marker>duration*2){
░██▄▀██▄█░░░▄░░░░░░░██░░░░▀▀▀▀▀░░░░██░░░░░░░░░░░░░if(cat_h_speed>0){
░░▀██▄▀██░░░░░░░░▀░██▀░░░░░░░░░░░░░▀██░░░░░░░░░░░░░░░░cat_x++;
░░░░▀████░▀░░░░▄░░░██░░░▄█░░░░▄░▄█░░██░░░░░░░░░░░░}
░░░░░░░▀█░░░░▄░░░░░██░░░░▄░░░▄░░▄░░░██░░░░░░░░}
░░░░░░░▄█▄░░░░░░░░░░░▀▄░░▀▀▀▀▀▀▀▀░░▄▀░░░░░}
░░░░░░█▀▀█████████▀▀▀▀████████████▀░░░}
░░░░░░████▀░░███▀░░░░░░▀███░░▀██▀░}
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░}                         
░░░░░░░░░░░░░░░░░░░░░░░░░░}
░░░░░░░░░░░░░░░░░░░░░░}
░░░░░░░░░░░░░░░░░░}
░░░░░░░░░░░░░░}
░░░░░░░░░░}
░░░░░░}
  }
  temp_procedure_time[k] = procedure_time[routineIndex][j];
  temp_procedure_words[k] = procedure_words[routineIndex][j];
  k++;
  
  pointIndex = newPointIndex;
  arrayCopy(temp_procedure_time,procedure_time[routineIndex]);
  arrayCopy(temp_procedure_words,procedure_words[routineIndex]);
}
*/

void trim_points(){
  order_points();
  if(procedure_time[routineIndex][0] > 0){
    float tempOff = procedure_time[routineIndex][0];
    
    for(int i = 0; i < points[routineIndex]; i++){
      procedure_time[routineIndex][i]-=tempOff;
      //procedure_time[routineIndex][i] = float(round(procedure_time[routineIndex][i]*10))/10;
    }
  }
}

float median(float a, float b, float c){
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
