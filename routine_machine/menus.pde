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

void establish_menus(){
  
  menu_titles[0] = "Your Routines";
  menu_titles[1] = "Edit Routines";
  menu_titles[2] = "Settings";
  menu_titles[3] = "Credits";
  menu_titles[4] = "Alarms";
  menu_titles[5] = "Alarms";
  menu_titles[6] = "Colors";
  menu_titles[7] = "Choose Color";
  
  menus[0] = procedures.length+1;
  menus[1] = procedures.length+1;
  menus[2] = 5;
  menus[3] = 4;
  menus[4] = 5;
  menus[5] = 6;
  menus[6] = 4;
  menus[7] = 5;
  
  for(int i = 0; i < menus[0]-1; i++){
    menu[0][i] = procedures[i];
    menu[1][i] = procedures[i];
  }
  menu[0][menus[0]-1] = "Settings";
  menu[1][menus[1]-1] = "Done";
  menu[2][0] = "Edit Routines";
  menu[2][1] = "Default Alarm";
  menu[2][2] = "Default Colors";
  menu[2][3] = "Credits";
  menu[2][4] = "Done";
  menu[3][0] = "Created By Andrew Harvey";
  menu[3][1] = "Developed as a personal tool and adapted for the play store";
  menu[3][2] = "Report issues to STEMGameDesignClub@gmail.com";
  menu[3][3] = "Done";
  menu[4][0] = "Repeat 3 Times"; //load
  menu[4][1] = "No Sound"; //load
  menu[4][2] = "Flash Phone Light"; //load
  menu[4][3] = "Play";
  menu[4][4] = "Done";
  menu[5][0] = menu[4][0];
  menu[5][1] = "Custom Sound";
  menu[5][2] = "Record";
  menu[5][3] = menu[4][2];
  menu[5][4] = "Play";
  menu[5][5] = "Done";
  menu[6][0] = "Text Color";
  menu[6][1] = "Background Color";
  menu[6][2] = "Accent Color";
  menu[6][3] = "Done";
  menu[7][0] = "Red";
  menu[7][1] = "Hue 0";
  menu[7][2] = "Saturation 10";
  menu[7][3] = "Brightness 10";
  menu[7][4] = "Done";
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
  
  //colorMode(RGB);
  fill(0,0,255);
  rect(2,2,width-5,height/5-2);
  //colorMode(0,255);
  
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
            set_menu(1);
          break;
          case 1:
            set_menu(4);
          break;
          case 2:
            set_menu(6);
          break;
          case 3:
            set_menu(3);
          break;
          case 4:
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
        menu[a][b] = "Play";
        switch(b){
          case 0:
            //incriment repeat
            menu[a][b] = "Repeat "+99+" Times";
          break;
          case 1:
            //change alarm sound type
            //if(record){
              menu[5][0] = menu[4][0];
              menu[5][3] = menu[4][2];
              set_menu(5);
            //}
          break;
          case 2:
            menu[a][b] = "Flash Phone Light and Screen";
          break;
          case 3:
            if(menu[a][b] == "Play"){
              menu[a][b] = "Stop";
              //play audio
            }
          break;
          case 4:
            //this is variable!
            set_menu(2);
          break;
        }
        
      break;
      case 5:
        //stop recording
        menu[a][b] = "Record";
        //if playing, stop it
        menu[a][b] = "Play";
        switch(b){
          case 0:
            //incriment repeat
            menu[4][b] = "Repeat "+99+" Times";
            menu[a][b] = menu[4][b];
          break;
          case 1:
            //change alarm sound type
            menu[5][0] = menu[4][0];
            menu[5][3] = menu[4][2];
            set_menu(4);
          break;
          case 2:
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
            set_menu(7);
          break;
          case 1:
            menu_titles[7] = "Background Color";
            set_menu(7);
          break;
          case 2:
            menu_titles[7] = "Accent Color";
            set_menu(7);
          break;
          case 3:
            set_menu(2);
          break;
        }
      break;
      case 7:
        switch(b){
          case 0:
            menu[a][b] = "Orange";
          break;
          case 1:
            menu[a][b] = "Hue 1";
          break;
          case 2:
            menu[a][b] = "Saturation 0";
          break;
          case 3:
            menu[a][b] = "Brightness 0";
          break;
          case 4:
            set_menu(6);
          break;
        }
      break;
    }
  }
}
