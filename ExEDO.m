function dydx = ExEDO(x,y)
%Fun��o que cont�m a equa��o de exemplo
% de uma EDO de primeira ordem.
%Em caso de uma nova EDO, basta mudar em dydx.
dydx=(-1.2*y) + 7*exp(-0.3*x);  