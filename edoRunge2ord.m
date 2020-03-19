function[x,y]= edoRunge2ord(EDO,a,b,h,yINI)
% Esta  função é responsável por resolver uma EDO de primeira ordem
%através do método de Runge Kutta de 2ª ordem.
%EDO é uma String de uma função em arquivo que calcula dy/dx.
%a valor inicial de x.
%b valor final de x.
%h Passo de integração.
%yINI valor inicial de y .
x(1)=a;y(1)= yINI; % atribuição dos valores iniciais de x(1), y(1).
N=(b-a)/h;  % quantidade de iterações.
for i = 1:N
    x(i+1) = x(i)+h; %equação dos próximos pontos.
    k1 = feval(EDO,x(i),y(i)); %inclinação no início do intervalo.
    yR=y(i) + k1*h;  %equação auxiliar da próxima equação.
    k2= feval(EDO,x(i+1),yR); %inclinação estimada no final do intervalo.
    y(i+1) = y(i)+(k1+k2)*h/2; %calcula a solução númerica na iteração i. 
end    