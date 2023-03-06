cd "C:\Users\mca08\Downloads\Macroeconomía aplicada"  //sets working directory
use ppi  //introduces the series

tsset time //Turns time in file ppi into a time series
gen lppi = log(ppi) //Gets the log of the series ppi
tsline lppi //plots lppi series

ac lppi
pac lppi

gen dlppi=d.lppi //Generate te first-difference
regress dlppi l.lppi time l(1/12).dlppi //Regress first-difference lppi against first lag of log ppi, time and first to twelfth lags of first-difference lppi

test l9.dlppi l10.dlppi l11.dlppi l12.dlppi  //We test of these lags are significant, null hypothesis is that they are all equal to zero
//We find that these lags are not significant, so we run the regression without them

quietly regress dlppi l.lppi time l(1/8).dlppi //quietly just prevents the regression summary to appear.
//And we test lags 5 to 8:
test l5.dlppi l6.dlppi l7.dlppi l8.dlppi
//For a 10% confidence level, these lags are significant
predict resid, r //We predict the residuals
//and see if they're white noise:
tsline resid
ac resid 
pac resid
corrgram resid, lags(20) //Gives a correlogram summary


dfuller lppi, trend lags(8) regress //With this command we do the same as before, and we get it automatically, we just indicate if it should include trend or not, and the number of lags
//In this case we find that we can't reject the null hypothesis that rho is 1, which means that lppi is random walk, non-stationary

dfuller lppi, lags(8) regress //We repeat but without the trend
//Again, we can't reject the null hypothesis

dfuller dlppi, trend lags(8) //We run the ADF test with the first-difference. For this we should reject the null hypothesis that rho equals 1, which is what we get
dfuller dlppi, lags(8) //We reject the null hypothesis again
