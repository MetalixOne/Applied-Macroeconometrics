cd "C:\Users\mca08\Downloads\Macroeconomía aplicada\Practical Lecture 6"
use usmacro
tsline dlrinv
tsline dlrgdp
tsline dlrcons
*Just from looking from the graphs, the three variables seem to be stationary

dfuller dlrinv, lags(12)
dfuller dlrgdp, lags(12)
dfuller dlrcons, lags(12)
*The ADF test for the three variables has a p-vale lower than 0.05. So I reject the null hypothesis that they are unit-root processes, they are stationary.

varsoc dlrinv dlrgdp dlrcons, maxlag(12)
*The varsoc command indicates that the FPE and AIC  suggest using 6 lags, while the HQIC and SBIC suggest using 1 lag.

var dlrinv dlrgdp dlrcons, lags(1/6)

predict r_dlrinv, r eq(dlrinv)
predict r_dlrgdp, r eq(dlrgdp)
predict r_dlrcons, r eq(dlrcons)

corrgram r_dlrinv, lags(20)
corrgram r_dlrgdp, lags(20)
corrgram r_dlrcons, lags(20)
*Correlograms indicate there is no statistical evidence of autocorrelation

vargranger
*Granger Casuality test indicates that investment and consumpltion do not granger cause income; and that income and consumption do not granger cause investment. However, investment and income do granger cause consumption.

var dlrinv dlrgdp dlrcons, lags(1)

predict r_dlrinv1, r eq(dlrinv)
predict r_dlrgdp1, r eq(dlrgdp)
predict r_dlrcons1, r eq(dlrcons)

corrgram r_dlrinv1, lags(20)
corrgram r_dlrgdp1, lags(20)
corrgram r_dlrcons1, lags(20)

vargranger