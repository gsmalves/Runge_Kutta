function[x,y]= edoRunge3ord(EDO,a,b,h,yINI)
% Esta  função é responsável por resolver uma EDO de primeira ordem
%através do método de Runge Kutta de 3ª ordem.
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
    xAux = x(i)+h/2;   %funções auxiliares do k2
    yK1 = y(i) + k1*h/2;
    k2= feval(EDO, xAux,yK1); % calculo do k2.
    xAux2 = x(i)+h;  %funções auxiliares do k3.
    aux3 =y(i)-(k1*h)+2*k2*h;
    k3= feval(EDO,xAux2,aux3); %inclinação estimada no final do intervalo.
    y(i+1) = y(i)+(k1+(4*k2)+k3)*h/6; %calcula a solução númerica na iteração i. 
end    