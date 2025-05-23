data{

  int N;
  vector[N] x_obs;
  vector[N] y_obs;
  real sigma;
  real tau;

}

parameters { 

  real m;
  real c;

  vector[N] x;
  
}

transformed parameters {

  vector[N] y;
  
  y = m * x + c;
  
}

model {

  x_obs ~ normal(x, tau);
  y_obs ~ normal(y, sigma);
  
  
}
