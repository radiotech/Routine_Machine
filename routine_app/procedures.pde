String procedures[];
float procedure_time[][];
String procedure_words[][];
int times;

void load_procedures(){
  procedure_count = 0;//load the number of procedures
  procedures = new String[100];//load procedure names in procedures[];
  procedure_time = new float[100][100];//load event times procedure_times[];
  procedure_words = new String[100][100];//load event names procedure_words[];
  
  int times = 0;
}

void add_procedure(){
  routines++;
  procedures[routines-1] = "New Routine"; //make name change automatic
  edit_procedure(routines-1);
}

void edit_procedure(int a){
  show_menu = false;
  set_edit_routine(a);
}

void add_point(float a){
  points[routineIndex]++;
  procedure_time[routineIndex][points[routineIndex]-1] = round(a);
  procedure_words[routineIndex][points[routineIndex]-1] = "New Event"; //make name change automatic
  
  pointIndex = points[routineIndex]-1;
  trim_points();
  edit_point(pointIndex);
}

void remove_point(int a, int b){
  order_points();
  
  if(b == 1){
    if(a < points[routineIndex]-1){
      float tempDur = procedure_time[routineIndex][a]-procedure_time[routineIndex][a+1];
      for(int i = 0; i < points[routineIndex]; i++){
        if(i > a){
          procedure_time[routineIndex][i] += tempDur;
        }
      }
    }
  }
  
  procedure_time[routineIndex][a] = procedure_time[routineIndex][points[routineIndex]-1]+1;
  order_points();
  points[routineIndex]--;
  if(a > points[routineIndex]-1){
    pointIndex = 0;
  }
  trim_points();
}

boolean select_point(float a, int b){  
  int tempPoint;
  if(b == 1){
    tempPoint = points[routineIndex];
    for(int k = points[routineIndex]-1; k >= 0; k--){
      if(procedure_time[routineIndex][k] > a){
        tempPoint = k;
      }
    }
    if(tempPoint > 0){
      tempPoint--;
    }
  
  } else {
    tempPoint = -1;
    for(int k = 0; k < points[routineIndex]; k++){
      if(round(procedure_time[routineIndex][k]) == round(a)){
        tempPoint = k;
      }
    }
  }
  
  if(tempPoint >= 0){
    pointIndex = tempPoint;
    return true;
  } else {
    return false;
  }
}

void edit_point(int a){
  pointIndex = a;
  unset_edit_point();
  set_menu(8);
}
