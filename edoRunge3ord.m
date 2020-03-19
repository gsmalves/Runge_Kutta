function[x,y]= edoRunge3ord(EDO,a,b,h,yINI)
% Esta  fun��o � respons�vel por resolver uma EDO de primeira ordem
%atrav�s do m�todo de Runge Kutta de 3� ordem.
%EDO � uma String de uma fun��o em arquivo que calcula dy/dx.
%a valor inicial de x.
%b valor final de x.
%h Passo de integra��o.
%yINI valor inicial de y .
x(1)=a;y(1)= yINI; % atribui��o dos valores iniciais de x(1), y(1).
N=(b-a)/h;  % quantidade de itera��es.
for i = 1:N
    x(i+1) = x(i)+h; %equa��o dos pr�ximos pontos.
    k1 = feval(EDO,x(i),y(i)); %inclina��o no in�cio do intervalo.
    xAux = x(i)+h/2;   %fun��es auxiliares do k2
    yK1 = y(i) + k1*h/2;
    k2= feval(EDO, xAux,yK1); % calculo do k2.
    xAux2 = x(i)+h;  %fun��es auxiliares do k3.
    aux3 =y(i)-(k1*h)+2*k2*h;
    k3= feval(EDO,xAux2,aux3); %inclina��o estimada no final do intervalo.
    y(i+1) = y(i)+(k1+(4*k2)+k3)*h/6; %calcula a solu��o n�merica na itera��o i. 
end    