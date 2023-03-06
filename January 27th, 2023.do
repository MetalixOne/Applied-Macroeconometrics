//We'll make a white noise process
//Used to set the number of observations
set obs 200

//Used to generate a uniform normal distribution so we can have a white noise process
gen wn=invnormal(uniform())
gen t=_n

//Used to graph the process
tsset t

//Used to graph the Autocorrelations
ac wn

//Used to graph the partial autocorrelations
pac wn





//We'll make a AR(1) process, and check if it is stationary.
//It should be stationary if it comes back to its mean, and it has a constant mean, variance and covariance over time.

//Generate the AR(1) process
//We make y1 be the same as the first observation in the white noise
gen y1=wn if t==1
//The other observations in y1 are being replaced by the lags, generating the AR(1) process
replace y1=1+0.5*l.y1+wn if t>1

tsline y1
ac y1
pac y1





//We'll generate another AR(1) process
gen y2=wn if t==1
replace y2=1-0.5*l.y2+wn if t>1

tsline y2
ac y2
pac y2








//We'll generate a MA(1) process
gen y4=wn if t==1
replace y4=wn-0.5*l.wn if t>1

tsline y4
ac y4
pac y4