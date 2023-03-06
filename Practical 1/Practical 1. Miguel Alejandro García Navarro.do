//Miguel Alejandro García Navarro 1919323

set obs 100 //this sets the observations

gen wn=invnormal(uniform()) //this generates a white noise process (zero-mean, constant variance, 0 autocorrelation)
label var wn "white noise process" //gives the  variable wn the label "white noise process"
summ wn //gives a summary of the properties of wn

gen t=_n //generates a variable that goes from observation 1 to N
ttset t //makes t a time series

tsline wn //plots wn as a time series

gen y=1+0.5*t+wn //This generates a pure deterministic trend model
tsline y //plots y
regress y t //runs a regression of y against t
predict ys, resid //predicts the residuals and calls them ys
label var ys "detrended series y" //gives the variable ys the label "detrended series y"
tsline ys //plots the series ys the residuals
tsline ys wn //plots the series ys, the residuals, and wn, the white noise process, which should be the same

gen y1=wn if t==1 //takes only the first observation of the white noise process
replace y1 = 0.7*l.y1 + 0.5*t + wn if t>1 //makes the rest of observations of y1 be equal to something that depends on the lags of the same series, but there is also again the trend. This series is a AR(1) with trend, it is a deterministic trend with stationary AR(1) component
tsline y1 //plots y1
regress y1 t //runs a regression of y1 against t, this is done to detrend the series
predict ys1, resid //predicts the residuals of the regression, which should be just the AR(1) part of the series, a stationary one.
label var ys1 "detrended series y1" //gives the variable ys1 the label "detrended series y1"
tsline ys1 //plots the series ys1

gen y2=wn if t==1 //takes only the first observation of the white noise process
replace y2 = 0.7*l.y2 + wn if t>1 //makes the rest of the observation dependent on lags, this is a stationary AR(1) model, AR models are always stationary
tsline y2 //plots the series y2
tsline y2 ys1 //plots both series because y2 is the same as y1, but without the trend part, so the residuals of y1, ys1, must be the same as y2

gen y3 = wn if t == 1 //Only takes the first observation of the white noise process
replace y3 = l.y3 + wn if t>1 //It's generating a random walk process
tsline y3 //plots series y3
tsline y2 y3 //plots y2 and y3 and compares them, they are similar but y2 is stationary while y3 is not, it is random walk
gen y3d = d.y3 //gets first-difference of series y3
tsline y3d //plots series y3d, which is stationary because we expect to get just the white noise part
tsline y3d wn