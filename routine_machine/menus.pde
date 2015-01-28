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
