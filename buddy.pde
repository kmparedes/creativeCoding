class Buddy{
  int growth;
  float xScale;
  float yScale;
  boolean attacked;
  PImage[] buddyImg = new PImage[3];
  PImage currImg;

  
  String[] imgString = {"buddyV1.png", "buddyV2.PNG", "buddyV3.PNG"};
  
  
  Buddy(){

    for(int i = 0; i < buddyImg.length; ++i){
      buddyImg[i] = loadImage(imgString[i]);
  }
    growth = 0;
    
    currImg = buddyImg[0];

    xScale = currImg.width*0.05;
    yScale = currImg.height*0.05;
    
    attacked = false;
  }
  
  void eat(){
    //growth change
    growth += 20;
  }
  
  boolean attacked(Snake s){
    float d = dist(mouseX, mouseY, s.xPos, s.yPos);
    if ((d < (xScale/2) + (s.xScale/2)) && s.visible){
      growth -= 1;
      return true;
    }
    return false;
  }
  
  void display(){
    imageMode(CENTER);
    if (growth < 50){
      currImg = buddyImg[0];
      //image(buddyImg[0], mouseX, mouseY, xScale, yScale);
    }
    else if (growth > 50 && growth < 100){
      currImg = buddyImg[1];
      //image(buddyImg[2], mouseX, mouseY, xScale, yScale);
      
    }
    else if (growth > 100){
      currImg = buddyImg[2];
      //image(buddyImg[3], mouseX, mouseY, xScale, yScale);
      
    }
    xScale = currImg.width*0.05;
    yScale = currImg.height*0.05;
    image(currImg, mouseX, mouseY, xScale, yScale);
  }
  
  int getGrowth(){
    return growth;
  }
  
}
