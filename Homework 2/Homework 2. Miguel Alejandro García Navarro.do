cd "C:\Users\mca08\Downloads\Macroeconomía aplicada\Homework 2"

use ppi

generate lppi=log(ppi)
generate inflation=d.lppi

tsline inflation
ac inflation
pac inflation
corrgram inflation

arima inflation, arima(1,0,1)
estat ic
predict resid, r
tsline resid
ac resid
pac resid
corrgram resid, lags(20)

gen sqres=resid*resid
corrgram sqres, lags(20)
ac sqres
pac sqres

arima sqres, ar(1/8)
test l5.ar l6.ar l7.ar l8.ar

arima sqres, ar(1/4)
test l1.ar l2.ar l3.ar l4.ar

arch inflation, ar(1) ma(1) arch(1/4)

predict resid1, r
predict var, v
gen sr1=resid1/sqrt(var)
gen sqres1=sr1*sr1
corrgram resid1, lags(20)
corrgram sqres1, lags(20)

arch inflation, ar(1) ma(1) arch(1) garch(1)

predict resid2, r
predict var2, v
gen sr2=resid2/sqrt(var2)
gen sqres2=sr2*sr2
corrgram resid2, lags(20)
corrgram sqres2, lags(20)