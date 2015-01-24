String[][] menu = new String[10][100];
int[] menus = new int[10];

void establish_menus(){
  menus[0] = 
  menus[1][0] = "Edit Routines";
  menus[1][1] = "edit";
  menus[]
}

void set_menu(){
  
  
  
  menu = true;
}

void update_menu(){
  
  background(0);

  noFill();
  stroke(255);
  strokeWeight(pad/10);
  
  if(slider_on){
    slider_fling = (slider_start+mouseY-slider_click) - slider_pos;
  } else {
    slider_fling /= 1.1;
  }
  slider_pos += slider_fling;
  if(slider_pos > 0){
    slider_pos = slider_pos/2;
  } else if(slider_pos < (-height/6*(procedures.length)+(height*4/5-7))){
    slider_pos = (slider_pos+(height/6*(procedures.length)-(height*4/5-7)))/2-(height/6*(procedures.length)-(height*4/5-7));
  }
  
  textAlign(CENTER,CENTER);
  float tempY;
  for(int i = 0; i < procedures.length+1; i++){
    tempY = round(slider_pos+height/5+i*height/6);
    line(3,tempY,width-4,tempY);
    if(i < procedures.length){
      fill(255);
      textFont(font, 70);
      text("Text"+i,width/2,tempY+height/12);
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
  text("Title",width/2,height/10);
}
