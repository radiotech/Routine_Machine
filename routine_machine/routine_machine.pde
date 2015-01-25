int pad = 20;
PFont font;

void setup(){  
  size(963,513);
  
  minim = new Minim(this);
  
  frameRate(60);
  
  font = loadFont("Monospaced.bold-48.vlw");
  
  load_procedures();
  establish_menus();
  set_menu(0);
  
}
  
void draw(){
  if(show_menu){
    update_menu();
  }
  if(show_routine){
    update_routine();
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
      menu_click(menuIndex, floor((-slider_pos+mouseY-height/5)/(height/6)));
    }
  }
}
