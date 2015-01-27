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
  show_timeline = true;
}

void update_edit_routine(){
  
  noFill();
  stroke(get_color(0));
  strokeWeight(height/250);
  textAlign(CENTER,CENTER);
  
  //lines
  
  line(width/2,height/5,width/2,height-height/25*2-1);
  line(3,height/5+height*18/25/4,width-4,height/5+height*18/25/4);
  line(3,height/5+height*18/25/4*2,width-4,height/5+height*18/25/4*2);
  line(3,height/5+height*18/25/4*3,width-4,height/5+height*18/25/4*3);
  
  
  
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
  line(3,height-height/25*2,width-4,height-height/25*2);
  
  fill(get_color(0));
  text("Edit "+"New Routine",width/2,height/10);
}

void set_edit_point(int a){
  //routineIndex = a; point index
  show_edit_point = true;
  show_timeline = true;
  show_text = true;
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
  text("Blocks/Points",width/8,height/5+(height-height/5-height/2)/4);
  text("Move",width/8*3,height/5+(height-height/5-height/2)/4);
  text("Strech",width/8*5,height/5+(height-height/5-height/2)/4);
  text("Delete",width/8*7,height/5+(height-height/5-height/2)/4);
  text("Add",width/8,height/5+(height-height/5-height/2)/4*3);
  text("Edit",width/8*3,height/5+(height-height/5-height/2)/4*3);
  text("",width/8*5,height/5+(height-height/5-height/2)/4*3);
  text("Back",width/8*7,height/5+(height-height/5-height/2)/4*3);
  
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
  text("Edit "+"New Routine"+"Points",width/2,height/10);
}
