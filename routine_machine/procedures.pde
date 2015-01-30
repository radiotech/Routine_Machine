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
  procedure_time[routineIndex][points[routineIndex]-1] = a;
  procedure_words[routineIndex][points[routineIndex]-1] = "New Event"; //make name change automatic
  
  order_points();
  
  edit_point(points[routineIndex]-1);
}

void edit_point(int a){
  pointIndex = a;
  unset_edit_point();
  set_menu(8);
}
