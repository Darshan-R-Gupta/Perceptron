ArrayList<Trainer> t;
Perceptron p;
//int count =0;
void setup(){
  fullScreen();
  t = new ArrayList<Trainer>();
  p = new Perceptron(3);
  float x,y_guess, y_correct;
  int answer;
  for(int i = 0; i < 300;++i){  //Start with 300 initial training points
    x = random(width);
    y_guess = random(height);
    y_correct = f(x);
    if(y_guess < y_correct){
      answer = 1;
    }
    else{
        answer = -1;
    }
    t.add(new Trainer(x, y_guess, answer) );
  }
}
void drawLine()
{
  
float x0 = 0;  
float y0 = f(x0);
float x1 = width;
float y1 = f(x1);
  

  stroke(0);
  strokeWeight(5);
  line(x0,y0,  x1,y1);
}
void draw(){
    background(255);
    drawLine();
    for(Trainer trainer: t){
    
      int guess = p.feedforward( trainer.inputs  );
      noStroke();
      if(guess > 0)  fill(255,0,0);
      else            fill(0,255,0);
      ellipse(trainer.inputs[0], trainer.inputs[1], 10,10); 
    }
    
}
void mousePressed(){
  float y = f(mouseX);
  int answer; 
  
  if(mouseY < y){
    answer = 1;
  }
  else {
      answer = -1;
  }
  
  t.add(new Trainer(mouseX, mouseY,answer)  ) ;
}
void keyPressed(){
  for(Trainer trainer : t){
    p.train(trainer.inputs, trainer.ans);
  }
}
float f(float x){
  return 0.5*x;
}
