cd "C:\Users\mca08\Downloads\Macroeconomía aplicada\Practical 2"
use ppi
tsset time
gen lppi = log(ppi)
gen dlppi = d.lppi

tsline lppi
ac lppi
pac lppi

quietly regress dlppi l.lppi time l(1/12).dlppi
test l9.dlppi l10.dlppi l11.dlppi l12.dlppi

quietly regress dlppi l.lppi time l(1/8).dlppi
test l5.dlppi l6.dlppi l7.dlppi l8.dlppi

predict resid, r
tsline resid
ac resid
pac resid
corrgram resid, lags(20)

dfuller lppi, trend lags(8)
dfuller lppi, lags(8)

rename dlppi inf
label var inf "Inflation"

tsline inf
ac inf
pac inf

dfuller inf, trend lags(8)
dfuller inf, lags(8)