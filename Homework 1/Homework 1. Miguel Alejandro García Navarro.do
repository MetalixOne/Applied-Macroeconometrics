cd "C:\Users\mca08\Downloads\Macroeconomía aplicada\Homework 1"

use ppi

generate lppi=log(ppi)
generate inflation=d.lppi

tsline inflation
ac inflation
pac inflation
corrgram inflation

arima inflation, ar(1)
estat ic
predict resid, r
tsline resid
ac resid
pac resid
corrgram resid

arima inflation, ar(1/2)
estat ic
predict resid2, r
tsline resid2
ac resid2
pac resid2
corrgram resid2

arima inflation, ma(1/4)
estat ic
predict resid3, r
tsline resid3
ac resid3
pac resid3
corrgram resid3

arima inflation, ma(1/5)
estat ic
predict resid4, r
tsline resid4
ac resid4
pac resid4
corrgram resid4

arima inflation, ma(1/6)
estat ic
predict resid5, r
tsline resid5
ac resid5
pac resid5
corrgram resid5

arima inflation, arima(1,0,1)
estat ic
predict resid6, r
tsline resid6
ac resid6
pac resid6
corrgram resid6

arima inflation, ar(1/3)
estat ic
predict resid7, r
tsline resid7
ac resid7
pac resid7
corrgram resid7

arima inflation, ar(1/4)
estat ic
predict resid8, r
tsline resid8
ac resid8
pac resid8
corrgram resid8

arima inflation, ma(1/3)
estat ic
predict resid9, r
tsline resid9
ac resid9
pac resid9
corrgram resid9

arima inflation, arima(2,0,1)
estat ic
predict resid10, r
tsline resid10
ac resid10
pac resid10
corrgram resid10