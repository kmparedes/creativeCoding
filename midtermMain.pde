int numApples = 15;
Apple[] apples = new Apple[1];
Buddy[] aBuddy = new Buddy[1];
Snake[] aSnake = new Snake[100];
float snakeNum = 1;

void setup(){
  size(1000,600);
  
  for (int i = 0; i < aSnake.length; ++i){
    aSnake[i] = new Snake(random(width), random(height));

  }
  aBuddy[0] = new Buddy();
  apples[0] = new Apple();
  aSnake[0].visible = true;
 
}

void displayScore(int s){
  int score = s;
  println(score);
}

void mousePressed(){
  //checks if Buddy eats apples.
  for (int i = 0; i < apples.length; ++i){
    apples[i].eaten();
  }
  aBuddy[0].eat();
}

void checkStatus(){
  
  for (int i = 0; i < snakeNum; ++i){
    if (aSnake[i].visible && aBuddy[0].attacked(aSnake[i])){
      aSnake[floor(snakeNum)].changeVisible();
      snakeNum += 0.01;
      changeSnakeSpeed();
    }
  }
}

void changeSnakeSpeed(){
  for (int i = 0; i < aSnake.length; ++i){
    aSnake[i].changeSpeed();
  }
}
void draw(){
  background(212, 223, 158);
 
  aBuddy[0].display();
  
  for (int i = 0; i < snakeNum; ++i){
    aSnake[i].move();
    aSnake[i].bounce();
    aSnake[i].display();
  }
  
  apples[0].display();
  displayScore(aBuddy[0].growth);
  checkStatus();
}
