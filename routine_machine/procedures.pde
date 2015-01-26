String procedures[];
float procedure_time[][];
String procedure_words[][];
int times;

void load_procedures(){
  procedure_count = 0;//load the number of procedures
  procedures = new String[100];//load procedure names in procedures[];
  procedure_time = new float[100][100];//load event times procedure_times[];
  procedure_words = new String[100][100];//load event names procedure_words[];
  
  /*
  time[0] = 0; words[0] = "Wake up and\nget to kitchen";
  time[1] = 5; words[1] = "Drink breakfast/coffee";
  time[2] = 10; words[5] = "Get to the shower";
  time[3] = 12; words[6] = "Start and enter\nthe shower";
  time[4] = 14; words[7] = "Use the amber\nbar soap";
  time[5] = 16; words[8] = "Rinse off";
  time[6] = 18; words[9] = "Turn the water\noff and dry";
  time[7] = 20; words[10] = "Get to the kitchen";
  time[8] = 22; words[11] = "Get dressed and\napply deodorant";
  time[9] = 27; words[12] = "Mess with face";
  time[10] = 33; words[13] = "Mess with hair";
  time[11] = 40; words[2] = "Brush teeth ready";
  time[12] = 41; words[3] = "Brush teeth start";
  time[13] = 44; words[4] = "Brush teeth end";
  time[14] = 45; words[14] = "get: folders, laptop,\ncharger, phone, lunch,\ndrink, else";
  */
  int times = 0;
  if(times > 0){
    durration = floor(time[times-1]+1);
  }
}

void add_procedure(){
  
  //words[lastPoint(marker)]
  
  set_edit_routine(0);
}
