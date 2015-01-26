PFont font;

int reds[] = {9,0,0};
int greens[] = {9,0,0};
int blues[] = {9,0,9};
int color_part = 0;

int alarm[] = {3,0,0};
String alarm_names[][] = {{"No Sound","Buzzer","Bell","Custom Recording","Custom File"},{"No Flashing","Flash Light","Flash Screen","Flash All","Flash All x3"}};

void setup(){  
  size(963,513);
  
  frame.setResizable(true);
  minim = new Minim(this);
  
  frameRate(60);
  
  font = loadFont("Monospaced.bold-48.vlw");
  colorMode(RGB,9,9,9);
  
  
  
  load_procedures();
  establish_menus();
  set_menu(0);
  
}
  
void draw(){
  if(show_menu){
    update_menu();
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
}

void mousePressed(){
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
    
    if(abs(slider_click-mouseY)<3){
      menu_click(menuIndex, floor((-slider_pos+mouseY-height/5)/(height*4/25)));
    }
  }
}
