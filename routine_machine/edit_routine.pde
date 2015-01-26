boolean show_edit_routine = false;

void set_edit_routine(int a){
  routineIndex = a;
  show_edit_routine = true;
  show_timeline = true;
  show_text = true;
}

void unset_edit_routine(){
  show_edit_routine = false;
  show_timeline = true;
  show_text = true;
}

void update_edit_routine(){
  
  background(get_color(1));

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
