
class Snake{
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  PImage snakeHead;
  float xScale;
  float yScale;
  boolean visible;
  
  
  //movement borrowed from in class code
  Snake(float xPos, float yPos){
    this.xPos = xPos;
    this.yPos = yPos;
    int xDirect = floor(random(2)) * 2 -1;
    int yDirect = floor(random(2)) * 2 -1;
    xSpeed = 4 * xDirect;
    ySpeed = 4 * yDirect;
    snakeHead = loadImage("snakeHead.png");;
    xScale = snakeHead.width * 0.05;
    yScale = snakeHead.height * 0.05;
    visible = false;

  }
  
  void move(){
    xPos+= xSpeed;
    yPos += ySpeed;
  }
  
  void bounce(){
    if (xPos <= xScale/2 || xPos >= width - xScale / 2){
      xSpeed *= -1;
      if (xPos < xScale / 2){
        xPos = xScale /2;
       }
       else if(xPos > width - xScale /2){
         xPos = width - xScale /2;
       }
    }
    
    if (yPos <= yScale /2 || yPos >= height - yScale /2) {
      ySpeed *= -1;
      if (yPos < yScale /2) {
        yPos = yScale /2;
      }
      else if (yPos > height - yScale /2){
        yPos =  height - yScale /2;
      }
    }
    
  }
  void changeVisible(){
    visible = true;
  }
  
  void changeSpeed(){
    xSpeed -= 0.01;
    ySpeed -= 0.01;
  }

  void display(){
    imageMode(CENTER);
    if (visible == true){
      image(snakeHead, xPos, yPos,xScale, yScale);
    }
  }

}
