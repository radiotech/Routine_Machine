PFont font;

int reds[] = {9,0,0};
int greens[] = {9,0,0};
int blues[] = {9,0,9};
int color_part = 0;

String text_group[] = new String[101];
int text_group_x[] = new int[101];
int text_group_y[] = new int[101];
int text_group_w[] = new int[101];
int text_group_h[] = new int[101];
int text_group_length = 0;

int alarm[] = {3,0,0};
String alarm_names[][] = {{"No Sound","Buzzer","Bell","Custom Recording","Custom File"},{"No Flashing","Flash Light","Flash Screen","Flash All","Flash All x3"}};

int click_x = 0;
int click_y = 0;
int valid_click = 0;

void setup(){  
  size(963,513);
  
  frame.setResizable(true);
  //minim = new Minim(this);
  
  frameRate(60);
  
  font = loadFont("Monospaced.bold-48.vlw");
  colorMode(RGB,9,9,9);
  
  
  
  load_procedures();
  establish_menus();
  set_menu(0);
  
}
  
void draw(){
  background(get_color(1));
  if(show_menu){
    update_menu();
  }
  if(show_edit_point){
    update_edit_point();
  }
  if(show_edit_routine){
    update_edit_routine();
  }
  if(show_routine){
    update_routine();
  }
  if(show_timeline){
    update_timeline();
  }
  
  if(mousePressed){
    if(sqrt(pow(mouseX-click_x,2)+pow(mouseY-click_y,2))>height/100){
      valid_click = 0;
    }
  } else {
    if(valid_click == 2){
      valid_click = 0;
    } else if(valid_click == 1){
      valid_click = 2;
    }
  }
}

void mousePressed(){
  
  click_x = mouseX;
  click_y = mouseY;
  valid_click = 1;
  
  if(show_routine){
    if(mouseX>width*.75){
      next();
    }
    if(mouseX<width*.25){
      if(mouseY<height/8){
        set_menu(0);
        show_routine = false;
      } else {
        back();
      }
    }
  }
  
  if(show_menu){
    if(mouseY>height/6){
      slider_on = true;
      slider_start = slider_pos;
      slider_click = mouseY;
    }
  }
  
}

void mouseReleased(){
  if(slider_on){
    slider_on = false;
  }
}
boolean show_edit_routine = false;
boolean show_edit_point = false;

void set_edit_routine(int a){
  routineIndex = a;
  show_edit_routine = true;
  show_timeline = true;
  show_text = false;
}

void unset_edit_routine(){
  show_edit_routine = false;
  show_timeline = false;
}

void update_edit_routine(){
  
  noFill();
  stroke(get_color(0));
  strokeWeight(height/250);
  textAlign(CENTER,CENTER);
  
  //lines
  
  line(width/2,height/5,width/2,height/5*4);
  line(3,height/5*2,width-4,height/5*2);
  line(3,height/5*3,width-4,height/5*3);
  line(3,height/5*4,width-4,height/5*4);
  
  
  fill(get_color(0));
  
  text_group[0] = "Routine Name";
  text_group[1] = "Routine Alarm";
  text_group[2] = "Routine Color";
  text_group[3] = "";
  text_group[4] = "";
  text_group[5] = "Back";
  text_group_x[0] = width/4;
  text_group_x[1] = width/4*3;
  text_group_x[2] = width/4;
  text_group_x[3] = width/4*3;
  text_group_x[4] = width/4;
  text_group_x[5] = width/4*3;
  text_group_y[0] = height/10*3;
  text_group_y[1] = height/10*3;
  text_group_y[2] = height/10*5;
  text_group_y[3] = height/10*5;
  text_group_y[4] = height/10*7;
  text_group_y[5] = height/10*7;
  text_group_w[0] = width/2;
  text_group_w[1] = width/2;
  text_group_w[2] = width/2;
  text_group_w[3] = width/2;
  text_group_w[4] = width/2;
  text_group_w[5] = width/2;
  text_group_h[0] = height/5;
  text_group_h[1] = height/5;
  text_group_h[2] = height/5;
  text_group_h[3] = height/5;
  text_group_h[4] = height/5;
  text_group_h[5] = height/5;
  text_group_length = 6;
  
  text_group();
  
  if(valid_click == 2){
    valid_click = 0;
    switch(text_click()){
      case -1:
        valid_click = 2;
      break;
      case 0:
        //names
      break;
      case 1:
        //alarm
      break;
      case 2:
        //color
      break;
      case 3:
        //blank button
      break;
      case 4:
        //blank button
      break;
      case 5:
        unset_edit_routine();
        set_menu(2);
      break;
    }
  }
  
  text(text_scale_str(width,int((height/5-height/25*1.5)),height/25,"Edit Events"),width/2,height/5*4+(height/5-height/25*1.5)/2);
  
  if(valid_click == 2){
    if(mouseY>height/5*4){
      unset_edit_routine();
      set_edit_point(0);
    }
  }
  
  fill(get_color(2));
  noStroke();
  rect(2,2,width-5,height/5-2);
  
  noFill();
  strokeWeight(7);
  stroke(get_color(1));
  rect(-1,-1,width+2,height+2);
  strokeWeight(height/250);
  
  noFill();
  stroke(get_color(0));
  rect(2,2,width-5,height-5);
  
  fill(get_color(2));
  rect(2,2,width-5,height/5-2);
  
  line(3,height/5,width-4,height/5);
  //line(3,height-height/25*2,width-4,height-height/25*2);
  
  fill(get_color(0));
  text("Edit "+"New Routine",width/2,height/10);
}

void set_edit_point(int a){
  //routineIndex = a; point index
  show_edit_point = true;
  show_timeline = true;
  show_text = true;
}

void unset_edit_point(int a){
  //routineIndex = a; point index
  show_edit_point = false;
  show_timeline = false;
  show_text = false;
}

void update_edit_point(){
  
  noFill();
  stroke(get_color(0));
  strokeWeight(height/250);
  textAlign(CENTER,CENTER);
  
  strokeWeight(height/250/10);
  line(3,height-height/6,width-4,height-height/6);
  line(3,height-height/6*2,width-4,height-height/6*2);
  strokeWeight(height/250);
  line(3,height-height/6*3,width-4,height-height/6*3);
  fill(5);
  line(3,height/5+(height-height/5-height/2)/2,width-4,height/5+(height-height/5-height/2)/2);
  
  line(width/2,height/5,width/2,height/2);
  line(width/4,height/5,width/4,height/2);
  line(width/4*3,height/5,width/4*3,height/2);
  
  fill(get_color(0));
  
  text_group[0] = "Blocks/Points";
  text_group[1] = "Move";
  text_group[2] = "Strech";
  text_group[3] = "Delete";
  text_group[4] = "Add";
  text_group[5] = "Edit";
  text_group[6] = "";
  text_group[7] = "Back";
  text_group_x[0] = width/8;
  text_group_x[1] = width/8*3;
  text_group_x[2] = width/8*5;
  text_group_x[3] = width/8*7;
  text_group_x[4] = width/8;
  text_group_x[5] = width/8*3;
  text_group_x[6] = width/8*5;
  text_group_x[7] = width/8*7;
  text_group_y[0] = height/5+(height-height/5-height/2)/4;
  text_group_y[1] = height/5+(height-height/5-height/2)/4;
  text_group_y[2] = height/5+(height-height/5-height/2)/4;
  text_group_y[3] = height/5+(height-height/5-height/2)/4;
  text_group_y[4] = height/5+(height-height/5-height/2)/4*3;
  text_group_y[5] = height/5+(height-height/5-height/2)/4*3;
  text_group_y[6] = height/5+(height-height/5-height/2)/4*3;
  text_group_y[7] = height/5+(height-height/5-height/2)/4*3;
  text_group_w[0] = width/4;
  text_group_w[1] = width/4;
  text_group_w[2] = width/4;
  text_group_w[3] = width/4;
  text_group_w[4] = width/4;
  text_group_w[5] = width/4;
  text_group_w[6] = width/4;
  text_group_w[7] = width/4;
  text_group_h[0] = (height-height/5-height/2)/2;
  text_group_h[1] = (height-height/5-height/2)/2;
  text_group_h[2] = (height-height/5-height/2)/2;
  text_group_h[3] = (height-height/5-height/2)/2;
  text_group_h[4] = (height-height/5-height/2)/2;
  text_group_h[5] = (height-height/5-height/2)/2;
  text_group_h[6] = (height-height/5-height/2)/2;
  text_group_h[7] = (height-height/5-height/2)/2;
  text_group_length = 8;
  
  text_group();
  
  if(valid_click == 2){
    valid_click = 0;
    switch(text_click()){
      case -1:
        valid_click = 2;
      break;
      case 0:
        println("1");
      break;
      case 1:
        println("2");
      break;
      case 2:
        println("3");
      break;
      case 3:
        println("4");
      break;
      case 4:
        println("5");
      break;
      case 5:
        println("6");
      break;
      case 6:
        println("7");
      break;
      case 7:
        println("8");
        unset_edit_point(0);
        set_edit_routine(routineIndex);
      break;
    }
  }

  /*
  text(text_scale_str( width/4, (height-height/5-height/2)/2, height/25, ),width/8,height/5+(height-height/5-height/2)/4);
  text("Move",width/8*3,height/5+(height-height/5-height/2)/4);
  text("Strech",width/8*5,height/5+(height-height/5-height/2)/4);
  text("Delete",width/8*7,height/5+(height-height/5-height/2)/4);
  text("Add",width/8,height/5+(height-height/5-height/2)/4*3);
  text("Edit",width/8*3,height/5+(height-height/5-height/2)/4*3);
  text("",width/8*5,height/5+(height-height/5-height/2)/4*3);
  text("Back",width/8*7,height/5+(height-height/5-height/2)/4*3);
  */
  fill(get_color(2));
  noStroke();
  rect(2,2,width-5,height/5-2);
  
  noFill();
  strokeWeight(7);
  stroke(get_color(1));
  rect(-1,-1,width+2,height+2);
  strokeWeight(height/250);
  
  noFill();
  stroke(get_color(0));
  rect(2,2,width-5,height-5);
  
  fill(get_color(2));
  rect(2,2,width-5,height/5-2);
  
  line(3,height/5,width-4,height/5);
  
  fill(get_color(0));
  text(text_scale_str(width,height/5,height/25,"Edit "+"New Routine"+" Points"),width/2,height/10);
}
boolean show_menu;
String[][] menu = new String[10][100];
int[] menus = new int[10];
String[] menu_titles = new String[10];
int menuIndex;

float slider_pos;
boolean slider_on;
float slider_start;
float slider_click;
float slider_fling;

int procedure_count = 0;

void establish_menus(){
  
  menu_titles[0] = "Your Routines";
  menu_titles[1] = "Edit Routines";
  menu_titles[2] = "Settings";
  menu_titles[3] = "Credits";
  menu_titles[4] = "Alarms";
  menu_titles[5] = "Alarms";
  menu_titles[6] = "Colors";
  menu_titles[7] = "Choose Color";
  
  menus[0] = procedure_count+1;
  menus[1] = procedure_count+1;
  menus[2] = 6;
  menus[3] = 4;
  menus[4] = 5;
  menus[5] = 6;
  menus[6] = 4;
  menus[7] = 4;
  
  for(int i = 0; i < menus[0]-1; i++){
    menu[0][i] = procedures[i];
    menu[1][i] = procedures[i];
  }
  menu[0][menus[0]-1] = "Settings";
  menu[1][menus[1]-1] = "Done";
  menu[2][0] = "Add Routine";
  menu[2][1] = "Edit Routines";
  menu[2][2] = "Default Alarm";
  menu[2][3] = "Default Colors";
  menu[2][4] = "Credits";
  menu[2][5] = "Done";
  menu[3][0] = "Created By Andrew Harvey";
  menu[3][1] = "Developed as a personal tool and adapted for the play store";
  menu[3][2] = "Report issues to STEMGameDesignClub@gmail.com";
  menu[3][3] = "Done";
  menu[4][0] = "Default"; //load
  menu[4][1] = "Default"; //load
  menu[4][2] = "Default"; //load
  menu[4][3] = "Play";
  menu[4][4] = "Done";
  menu[5][0] = menu[4][0];
  menu[5][1] = menu[4][1];
  menu[5][2] = "Choose File";
  menu[5][3] = menu[4][2];
  menu[5][4] = "Play";
  menu[5][5] = "Done";
  menu[6][0] = "Text Color";
  menu[6][1] = "Background Color";
  menu[6][2] = "Accent Color";
  menu[6][3] = "Done";
  menu[7][0] = "Red";
  menu[7][1] = "Default";
  menu[7][2] = "Default";
  menu[7][3] = "Done";
}

void set_menu(int a){
  if(menuIndex != a){
    menuIndex = a;
    slider_pos = 0;
    slider_fling = 0;
  }
  
  show_menu = true;
}

void update_menu(){
  
  background(get_color(1));

  noFill();
  stroke(get_color(0));
  strokeWeight(height/250);
  
  if(menus[menuIndex]>4){
    if(slider_on){
      slider_fling = (slider_start+mouseY-slider_click) - slider_pos;
    } else {
      slider_fling /= 1.1;
    }
    slider_pos += slider_fling;
    if(slider_pos > 0){
      slider_pos = slider_pos/2;
    } else if(slider_pos < (-(height*4/25+.5)*(menus[menuIndex])+(height*4/5))){
      slider_pos = (slider_pos+((height*4/25+.5)*(menus[menuIndex])-(height*4/5)))/2-((height*4/25+.5)*(menus[menuIndex])-(height*4/5));
    }
  }
  
  textAlign(CENTER,CENTER);
  float tempY;
  for(int i = 0; i < menus[menuIndex]+1; i++){
    tempY = round(slider_pos+height/5+i*height*4/25);
    line(3,tempY,width-4,tempY);
    if(i < menus[menuIndex]){
      fill(get_color(0));
      textFont(font, 70);
      text(menu[menuIndex][i],width/2,tempY+height/12);
      noFill();
    }
  }
  
  fill(get_color(2));
  noStroke();
  rect(2,2,width-5,height/5-2);
  
  noFill();
  strokeWeight(7);
  stroke(get_color(1));
  rect(-1,-1,width+2,height+2);
  strokeWeight(height/250);
  
  noFill();
  stroke(get_color(0));
  rect(2,2,width-5,height-5);
  
  //colorMode(RGB);
  fill(get_color(2));
  rect(2,2,width-5,height/5-2);
  //colorMode(0,255);
  
  line(3,height/5,width-4,height/5);
  
  fill(get_color(0));
  text(menu_titles[menuIndex],width/2,height/10);
  
  if(valid_click == 2){
    menu_click(menuIndex, floor((-slider_pos+mouseY-height/5)/(height*4/25)));
    valid_click = 0;
  }
  
}
  
void menu_click(int a, int b){
  if(b<menus[a] && b>=0){
    switch(a){
      case 0:
        if(b<menus[0]-1){
          //load and start routine
          show_menu = false;
          set_routine(b);
        } else {
          set_menu(2);
        }
      break;
      case 1:
        if(b<menus[0]-1){
          //load and start routine
        } else {
          set_menu(2);
        }
      break;
      case 2:
        switch(b){
          case 0:
            add_procedure();
            
            //set_menu(1); Add routine and edit that routine
          break;
          case 1:
            set_menu(1);
          break;
          case 2:
            menu[4][0] = "Repeat "+alarm[0]+" Times";
            menu[4][1] = alarm_names[0][alarm[1]];
            menu[4][2] = alarm_names[1][alarm[2]];
            if(alarm[1] == 3 || alarm[1] == 4){
              menu[5][0] = menu[4][0];
              menu[5][1] = menu[4][1];
              menu[5][3] = menu[4][2];
              set_menu(5);
            } else {
              set_menu(4);
            }
          break;
          case 3:
            set_menu(6);
          break;
          case 4:
            set_menu(3);
          break;
          case 5:
            set_menu(0);
          break;
        }
      break;
      case 3:
        switch(b){
          case 3:
            set_menu(2);
          break;
        }
      break;
      case 4:
        //if playing, stop it
        if(random(5)<1){
          //stop it
          menu[4][3] = " Play ";
        } else {
          menu[4][3] = "Play";
        }
        switch(b){
          case 0:
            alarm[0]++;
            if(alarm[0]>20){
              alarm[0] = 0;
            }
            menu[a][b] = "Repeat "+alarm[0]+" Times";
          break;
          case 1:
            alarm[1]++;
            if(alarm[1]>4){
              alarm[1] = 0;
            }
            menu[4][1] = alarm_names[0][alarm[1]];
            if(alarm[1] == 3 || alarm[1] == 4){
              menu[5][0] = menu[4][0];
              menu[5][1] = menu[4][1];
              menu[5][3] = menu[4][2];
              set_menu(5);
            }
          break;
          case 2:
            alarm[2]++;
            if(alarm[2]>4){
              alarm[2] = 0;
            }
            menu[4][2] = alarm_names[1][alarm[2]];
            //menu[a][b] = "Flash Phone Light and Screen";
          break;
          case 3:
            if(menu[4][3] == "Play"){
              menu[4][3] = "Stop";
              //play audio
            }
          break;
          case 4:
            //this is variable!
            set_menu(2);
          break;
        }
        if(menu[4][3] == " Play "){
          menu[4][3] = "Play";
        }
      break;
      case 5:
        //if playing, stop it
        if(random(5)<1){
          //stop it
          menu[5][4] = " Play ";
        } else {
          menu[5][4] = "Play";
        }
        if(alarm[1] == 3){
          //if recording, stop it
          if(random(5)<1){
            //stop it
            menu[5][3] = " Record ";
          } else {
            menu[5][3] = "Record";
          }
        }
        switch(b){
          case 0:
            alarm[0]++;
            if(alarm[0]>20){
              alarm[0] = 0;
            }
            menu[4][b] = "Repeat "+alarm[0]+" Times";
            menu[a][b] = menu[4][b];
          break;
          case 1:
            alarm[1]++;
            if(alarm[1]>4){
              alarm[1] = 0;
            }
            menu[4][1] = alarm_names[0][alarm[1]];
            if(alarm[1] != 3 && alarm[1] != 4){
              set_menu(4);
            }
            menu[a][b] = menu[4][b];
          break;
          case 2:
            if(alarm[1] == 3){
               menu[a][b] = "Choose File";
            }
            
            if(menu[a][b] == "Record"){
              menu[a][b] = "Stop Recording";
              //play audio
            }
          break;
          case 3:
            menu[4][b] = "Flash Phone Light and Screen";
            menu[a][b] = menu[4][b];
          break;
          case 4:
            if(menu[a][b] == "Play"){
              menu[a][b] = "Stop";
              //play audio
            }
          break;
          case 5:
            //this is variable!
            set_menu(2);
          break;
        }
      break;
      case 6:
        switch(b){
          case 0:
            menu_titles[7] = "Text Color";
            color_part = 0;
            set_menu(7);
          break;
          case 1:
            menu_titles[7] = "Background Color";
            color_part = 1;
            set_menu(7);
          break;
          case 2:
            menu_titles[7] = "Accent Color";
            color_part = 2;
            set_menu(7);
          break;
          case 3:
            set_menu(2);
          break;
        }
        menu[7][0] = "Red " + (reds[color_part]+1);
        menu[7][1] = "Green " + (greens[color_part]+1);
        menu[7][2] = "Blue " + (blues[color_part]+1);
      break;
      case 7:
        switch(b){
          case 0:
            reds[color_part]++;
            if(reds[color_part] >= 10){
              reds[color_part] = 0;
            }
          break;
          case 1:
            greens[color_part]++;
            if(greens[color_part] >= 10){
              greens[color_part] = 0;
            }
          break;
          case 2:
            blues[color_part]++;
            if(blues[color_part] >= 10){
              blues[color_part] = 0;
            }
          break;
          case 3:
            set_menu(6);
          break;
        }
      menu[7][0] = "Red " + (reds[color_part]+1);
      menu[7][1] = "Green " + (greens[color_part]+1);
      menu[7][2] = "Blue " + (blues[color_part]+1);
      break;
    }
  }
}
void next(){
  marker = ceil(60*time[median(lastPoint(marker)+1,0,times-1)]);
}

void back(){
  marker = ceil(60*time[median(lastPoint(marker-10),0,times-1)]);
}

color get_color(int a){
  return color(reds[a],greens[a],blues[a]);
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
  show_menu = false;
  set_edit_routine(0);
}
//import ddf.minim.*;

//Minim minim;
//AudioPlayer message;

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
boolean show_input_text = false;

void set_input_text(int a){
  show_input_text = true;
  //set text
  //keyBoardString = "";
}

void unset_input_text(){
  show_input_text = false;
}

void update_input_text(){
  
}
boolean show_timeline = false;
boolean show_text = true;

void update_timeline(){
  stroke(get_color(0));
  strokeWeight(height/250);
  if(show_text == true){
    
    line(height/25*1.5-1,height-height/25*1.5-height/6*2-height/50,height/25*1.5-1,height-height/25*1.5-height/6*2+height/50);
    line(width-height/25*1.5+1,height-height/25*1.5-height/50,width-height/25*1.5+1,height-height/25*1.5+height/50);
    
    line(height/25*1.5,height-height/25*1.5-height/6*2,width-4,height-height/25*1.5-height/6*2);
    line(3,height-height/25*1.5-height/6,width-4,height-height/25*1.5-height/6);
    line(3,height-height/25*1.5,width-height/25*1.5,height-height/25*1.5);
    //line(height/25+float(marker)/60*(width-height/25*2)/durration,height-height/25*.75,height/25+float(marker)/60*(width-height/25*2)/durration,height-height/25*1.25);
    
    
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

