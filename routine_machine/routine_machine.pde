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
