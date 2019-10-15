class Apple{
  float x;
  float y;
  PImage applePic;
  float xScale;
  float yScale;
  boolean appear;
  
  Apple(){
    applePic = loadImage("apple.png");
    
    xScale = applePic.width*0.05;
    yScale = applePic.height*0.05;
    
    x = random(xScale, width - xScale);
    y = random(yScale, height - yScale);
    
    appear = true;
  }
  
  void eaten(){ //check if the apple was eaten(clicked)
    float d = dist(mouseX, mouseY, x, y);
    if (d < xScale/2){
      changeLoc();
   
    }
  }
  
  void changeLoc(){
    x = random(xScale, width - xScale);
    y = random(yScale, height - yScale);
  }
  void display(){
    imageMode(CENTER);
    
    if (appear){
      image(applePic, x, y, xScale, yScale);
    }
    
  }
}
