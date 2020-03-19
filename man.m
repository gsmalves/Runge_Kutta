clear all
%Autor : Gustavo dos Santos Menezes Alves
%Data: 18/03/2020
%Projeto implementado no MATLAB R2016a.
%Arquivo principal do programa que executa os dois m�todos de Runge tanto o
%de 2� ordem, como o de 3� e realiza a compara��o com a solu��o exata (anal�tica)
%da EDO de primeira ordem com o PVI(Problema do valor inicial) que fora utilizada 
%como exemplo. Com o prop�sito de demonstrar que a sua precis�o aumenta  
%(isto �, o erro de truncamento diminui)� medida que a ordem do m�todo aumenta.
%S�o apresentados dos s��das no programa, no gr�fico de forma extra, plotado com a fun��o
%atrav�s dos pontos  de valor exato,  do m�todo de 2� ordem e de 3� ordem, indicadas na
%legenda presente no gr�fico. Para que haja uma breve e poss�vel a realiza��o de
%compara��o entre o m�todo que mais se aproxima da solu��o exata nos pontos iguais em x.
%Existe tamb�m as infroma��es de sa�das no console do Matlab de cada m�todo as
%suas coordenadas x e y, juntamente com as coordenadas da solu��o exata e o
%erro absoluto calculado com intuito de mostrar a precis�o de cada ordem.

% Chamada e plotagem dos M�todos
a=0; b = 2; h=0.5; yINI=3; % Atribui��o dos valores do dominio, passo de integra��o e valor inicial das vari�veis.
[x,y] = edoRunge2ord('ExEDO',a,b,h,yINI); %utilizando a fun��o de Kutta de 2� ordem
[x1,y1] = edoRunge3ord('ExEDO',a,b,h,yINI);%utilizando a fun��o de Kutta de 3� ordem
xp=a:0.5:b;  %Vetores para o tra�ado da solu��o exata, vale ressaltar que o valor entre a e b deve ser o mesmo do passo de integra��o
yp= 70/9*exp(-0.3*xp)-43/9*exp(-1.2*xp); %para que seja poss�vel realizar o calculo do erro corretamente, nas coordenadas iguais em x.
title('M�todo de Runge Kutta');% t�tulo do gr�fico
xlabel('x');ylabel('y'); %coordenadas
plot(xp,yp,'-g*');%plotagem gr�fico solu��o exata.
hold on ;%utilizado para poder plotar mais de uma fun��o no mesmo gr�fico
plot(x,y,'-b*'); %plotagem gr�fico Runge Kutta de 2� ordem.
hold on;
plot(x1,y1,'-r*');%gr�fico Runge Kutta de 3� ordem.
legend('Valor exato','RK 2�ORDEM','RK 3�ORDEM','Location','NorthEastOutside');

%Tabela com as Sa�das do m�todo de 2� ordem, compara��o com valor exato e
%erro absoluto.
disp('-------------------------------------------------------------------------------------------------------------------------------------------')
disp('Resultado do m�todo de Runge Kutta 2� ordem')
disp('-------------------------------------------------------------------------------------------------------------------------------------------')
disp(['xRK    : ' num2str(x)]);
disp(['yRK    : ' num2str(y)]);
disp(['xExato : ' num2str(xp)]);
disp(['yExato : ' num2str(yp)]);
erro = abs(yp-y);
disp(['Erro   : ' num2str(erro)]);

%Tabela com as Sa�das do m�todo de 3� ordem, compara��o com valor exato e
%erro absoluto.
disp('-------------------------------------------------------------------------------------------------------------------------------------------')
disp('Resultado do m�todo de Runge Kutta 3� ordem')
disp('-------------------------------------------------------------------------------------------------------------------------------------------')
disp(['xRK    : ' num2str(x1)]);
disp(['yRK    : ' num2str(y1)]);
disp(['xExato : ' num2str(xp)]);
disp(['yExato : ' num2str(yp)]);
erro = abs(yp-y1);
disp(['Erro   : ' num2str(erro)]);


