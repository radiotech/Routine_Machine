boolean show_edit_routine = false;
boolean show_edit_point = false;

int point_mode = 0; //points/blocks
int point_tool = 0; //select, move, strech, add

void set_edit_routine(int a){
  set_global_scale(1);
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
  strokeWeight(line);
  textAlign(CENTER,CENTER);
  
  //lines
  
  line(width/2,height/5,width/2,height/5*4);
  line(3,height/5+height/5*3/2,width-4,height/5+height/5*3/2);
  //line(3,height/5*2,width-4,height/5*2);
  //line(3,height/5*3,width-4,height/5*3);
  line(3,height/5*4,width-4,height/5*4);
  
  
  fill(get_color(0));
  
  text(text_scale_str(width,int((height/5-height/25*1.5)),height/25*2,"Edit Events"),width/2,height/5*4+(height/5-height/25*1.5)/2);
  
  fill(get_color(2));
  noStroke();
  rect(2,2,width-5,height/5-2);
  
  noFill();
  strokeWeight(height/50);
  stroke(get_color(1));
  rect(-1,-1,width+2,height+2);
  strokeWeight(line);
  
  noFill();
  stroke(get_color(0));
  rect(2,2,width-5,height-5);
  
  fill(get_color(2));
  rect(2,2,width-5,height/5-2);
  
  line(3,height/5,width-4,height/5);
  //line(3,height-height/25*2,width-4,height-height/25*2);
  
  fill(get_color(0));
  text(text_scale_str(width,height/5,height/25,"Edit "+procedures[routineIndex]),width/2,height/10);
  
  text_group[0] = "Routine Name";
  text_group[1] = "Routine Alarm";
  text_group[2] = "Routine Color";
  text_group[3] = "Back";
  //text_group[4] = "";
  //text_group[5] = "Back";
  text_group_x[0] = width/4;
  text_group_x[1] = width/4*3;
  text_group_x[2] = width/4;
  text_group_x[3] = width/4*3;
  //text_group_x[4] = width/4;
  //text_group_x[5] = width/4*3;
  text_group_y[0] = height/5+height/5*3/4;
  text_group_y[1] = height/5+height/5*3/4;
  text_group_y[2] = height/5+height/5*3/4*3;
  text_group_y[3] = height/5+height/5*3/4*3;
  //text_group_y[4] = height/10*7;
  //text_group_y[5] = height/10*7;
  text_group_w[0] = width/2;
  text_group_w[1] = width/2;
  text_group_w[2] = width/2;
  text_group_w[3] = width/2;
  //text_group_w[4] = width/2;
  //text_group_w[5] = width/2;
  text_group_h[0] = height/5;
  text_group_h[1] = height/5;
  text_group_h[2] = height/5;
  text_group_h[3] = height/5;
  //text_group_h[4] = height/5;
  //text_group_h[5] = height/5;
  text_group_length = 4;
  
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
        unset_edit_routine();
        set_menu(6);
      break;
      case 3:
        set_global_scale(0);
        unset_edit_routine();
        set_menu(2);
      break;
    }
  }
  
  
  
  if(valid_click == 2){
    if(mouseY>height/5*4){
      valid_click = 0;
      unset_edit_routine();
      set_edit_point(0);
    }
  }
}

void set_edit_point(int a){
  //routineIndex = a; point index
  set_global_scale(2);
  pointIndex = a;
  show_edit_point = true;
  show_timeline = true;
  show_text = true;
  
  if(points[routineIndex] > 0){
    pad_duration(10, false);
  } else {
    duration = 60;
  }
}

void unset_edit_point(){
  //routineIndex = a; point index
  show_edit_point = false;
  show_timeline = false;
  show_text = false;
}

void update_edit_point(){
  
  fill(get_color(2));
  noStroke();
  
  rect(width/4*point_tool,height/5,width/4,(height/2-height/5)/2+1);
  
  noFill();
  stroke(get_color(0));
  strokeWeight(line);
  textAlign(CENTER,CENTER);
  
  strokeWeight(ceil(line/2)-1);
  line(3,height-height/6,width-4,height-height/6);
  line(3,height-height/6*2,width-4,height-height/6*2);
  strokeWeight(line);
  line(3,height-height/6*3,width-4,height-height/6*3);
  fill(5);
  line(3,height/5+(height-height/5-height/2)/2,width-4,height/5+(height-height/5-height/2)/2);
  
  line(width/2,height/5,width/2,height/2);
  line(width/4,height/5,width/4,height/2);
  line(width/4*3,height/5,width/4*3,height/2);
  
  
  fill(get_color(2));
  noStroke();
  rect(2,2,width-5,height/5-2);
  
  noFill();
  strokeWeight(height/50);
  stroke(get_color(1));
  rect(-1,-1,width+2,height+2);
  strokeWeight(line);
  
  noFill();
  stroke(get_color(0));
  rect(2,2,width-5,height-5);
  
  fill(get_color(2));
  rect(2,2,width-5,height/5-2);
  
  line(3,height/5,width-4,height/5);
  
  fill(get_color(0));
  text(text_scale_str(width,height/5,height/25,"Edit "+procedures[routineIndex]+" Points"),width/2,height/10);
  
  fill(get_color(0));
  
  text_group[0] = "Select";
  text_group[1] = "Move";
  text_group[2] = "Strech";
  text_group[3] = "Add";
  text_group[4] = "Edit";
  text_group[5] = "Delete";
  if(point_mode == 0){
    text_group[6] = "Points";
  } else {
    text_group[6] = "Blocks";
  }
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
        point_tool = 0;
      break;
      case 1:
        point_tool = 1;
      break;
      case 2:
        point_tool = 2;
      break;
      case 3:
        point_tool = 3;
      break;
      case 4:
        println("5");
      break;
      case 5:
        println("6");
      break;
      case 6:
        if(point_mode == 0){
          point_mode = 1;
        } else {
          point_mode = 0;
        }
      break;
      case 7:
        
        unset_edit_point();
        set_edit_routine(routineIndex);
      break;
    }
    if(valid_click == 2){
      if(mouseY>height/2){
        valid_click = 0;
        switch(point_tool){
          case 0:
          
          break;
          case 1:
          
          break;
          case 2:
          
          break;
          case 3:
          add_point(bigline_to_time(mouseX,mouseY));
          unset_edit_point();
          set_menu(8);
          break;
        }
      }
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

}
