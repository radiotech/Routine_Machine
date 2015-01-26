void next(){
  marker = ceil(60*time[median(lastPoint(marker)+1,0,times-1)]);
}

void back(){
  marker = ceil(60*time[median(lastPoint(marker-10),0,times-1)]);
}

color get_color(int a){
  return color(colors[a]*10+hues[a],saturations[a],brightnesses[a]);
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
  if(position/60>=time[times-1]){
    return times-1;
  } else {
    return 0;
  }
}
