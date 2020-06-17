class Perceptron{
  float[] weights;
  float lc;  //The learning constant
  Perceptron(int n){
    weights = new float[n];
    for(int i =0; i< n;++i){
      weights[i] = random(-1,1);
    }
    lc = 0.01;
  }
  int activate(int num){
    if(num > 0)  return 1;
    else          return -1;
  }
  int feedforward(float input[] ){
    int sum =0;
    for(int i = 0; i < input.length; ++i){
      sum += weights[i]*input[i];
    }
    return activate(sum);
  }
  void train(float input[], int desired){  
    int guess = feedforward(input);
    int error = desired - guess;
    for(int i = 0; i < weights.length; ++i){
      weights[i] += (lc*error*input[i]);
    }
  }
}
