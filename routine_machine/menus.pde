boolean show_menu;
String[][] menu = new String[10][100];
int[] menus = new int[10];
String[] menu_titles = new String[10];
int menuIndex;


void establish_menus(){
  menu_titles[0] = "Your Routines";
  menu_titles[1] = "Edit Routines";
  menu_titles[2] = "Settings";
  menus[0] = procedures.length+1;
  menus[1] = procedures.length+1;
  menus[2] = 2;
  
  for(int i = 0; i < menus[0]-1; i++){
    menu[0][i] = procedures[i];
    menu[1][i] = procedures[i];
  }
  menu[0][menus[0]-1] = "Settings";
  menu[1][menus[1]-1] = "Done";
  menu[2][0] = "Edit Menus";
  menu[2][1] = "Done";
}

void set_menu(int a){
  menuIndex = a;
  show_menu = true;
}

void update_menu(){
  
  background(0);

  noFill();
  stroke(255);
  strokeWeight(pad/10);
  
  if(menus[menuIndex]>4){
    if(slider_on){
      slider_fling = (slider_start+mouseY-slider_click) - slider_pos;
    } else {
      slider_fling /= 1.1;
    }
    slider_pos += slider_fling;
    if(slider_pos > 0){
      slider_pos = slider_pos/2;
    } else if(slider_pos < (-(height/6+.5)*(menus[menuIndex])+(height*4/5))){
      slider_pos = (slider_pos+((height/6+.5)*(menus[menuIndex])-(height*4/5)))/2-((height/6+.5)*(menus[menuIndex])-(height*4/5));
    }
  }
  
  textAlign(CENTER,CENTER);
  float tempY;
  for(int i = 0; i < menus[menuIndex]+1; i++){
    tempY = round(slider_pos+height/5+i*height/6);
    line(3,tempY,width-4,tempY);
    if(i < menus[menuIndex]){
      fill(255);
      textFont(font, 70);
      text(menu[menuIndex][i],width/2,tempY+height/12);
      noFill();
    }
  }
  
  fill(25);
  noStroke();
  rect(2,2,width-5,height/5-2);
  
  noFill();
  strokeWeight(7);
  stroke(0);
  rect(-1,-1,width+2,height+2);
  strokeWeight(pad/10);
  
  noFill();
  stroke(255);
  rect(2,2,width-5,height-5);
  line(3,height/5,width-4,height/5);
  
  fill(255);
  text(menu_titles[menuIndex],width/2,height/10);
}

void menu_click(int a, int b){
  if(b<menus[0] && b>=0){
    switch(a){
      case 0:
        if(b<menus[0]-1){
          //load and start routine
        } else {
          set_menu(2);
        }
      break;
      case 1:
      
      break;
      case 2:
        switch(b){
          case 0:
            
          break;
          case 1:
          
          break;
          case 2:
            
          break;
        }
      break;
    }
  }
}
