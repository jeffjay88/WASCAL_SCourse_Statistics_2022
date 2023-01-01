*SPATIAL REGRESSION MODELS WITH STATA

*DATA IMPORTATION*
Copy the data from excel file and then paste in the data editor 


*SYNTAX COMMANDS TO USE IN ESTIMATING SPATIAL REGRESSION MODELS
*setting parameters 
global ylist varname
global xlist varlist
global xcoordx
global ycoordy
global band 10

summarize $ylist $xlist

*SPATIAL WEIGHT MATRIX
spatwmat, name(W) xcoord(lon) ycoord(lat) band (0 1) binary standardize eigenval(E)
matrix list W

*REGRESSION
reg $ylist $xlist

*DIAGNOSTIC TEST 
spatdiag, weights(W)

*MEASURING SPATIAL AUTOCORRELATION
spatlsa tx, weights(W) moran id(id) graph(moran)
spatgsa rr tx tn rh, weight(W) moran


*SPATIAL REGRESSION MODELS
spatreg $ylist $xlist, weight(W) eigenval(E) model(error)
spatreg $ylist $xlist, weight(W) eigenval(E) model(lag)


WHAT IS PANEL DATA
Panel data is a type of data that professionals collect by observing particular variables over a period of time at a regular frequency