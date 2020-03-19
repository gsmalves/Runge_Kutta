clear all
%Autor : Gustavo dos Santos Menezes Alves
%Data: 18/03/2020
%Projeto implementado no MATLAB R2016a.
%Arquivo principal do programa que executa os dois métodos de Runge tanto o
%de 2ª ordem, como o de 3ª e realiza a comparação com a solução exata (analítica)
%da EDO de primeira ordem com o PVI(Problema do valor inicial) que fora utilizada 
%como exemplo. Com o propósito de demonstrar que a sua precisão aumenta  
%(isto é, o erro de truncamento diminui)à medida que a ordem do método aumenta.
%São apresentados dos sáídas no programa, no gráfico de forma extra, plotado com a função
%através dos pontos  de valor exato,  do método de 2ª ordem e de 3ª ordem, indicadas na
%legenda presente no gráfico. Para que haja uma breve e possível a realização de
%comparação entre o método que mais se aproxima da solução exata nos pontos iguais em x.
%Existe também as infromações de saídas no console do Matlab de cada método as
%suas coordenadas x e y, juntamente com as coordenadas da solução exata e o
%erro absoluto calculado com intuito de mostrar a precisão de cada ordem.

% Chamada e plotagem dos Métodos
a=0; b = 2; h=0.5; yINI=3; % Atribuição dos valores do dominio, passo de integração e valor inicial das variáveis.
[x,y] = edoRunge2ord('ExEDO',a,b,h,yINI); %utilizando a função de Kutta de 2ª ordem
[x1,y1] = edoRunge3ord('ExEDO',a,b,h,yINI);%utilizando a função de Kutta de 3ª ordem
xp=a:0.5:b;  %Vetores para o traçado da solução exata, vale ressaltar que o valor entre a e b deve ser o mesmo do passo de integração
yp= 70/9*exp(-0.3*xp)-43/9*exp(-1.2*xp); %para que seja possível realizar o calculo do erro corretamente, nas coordenadas iguais em x.
title('Método de Runge Kutta');% título do gráfico
xlabel('x');ylabel('y'); %coordenadas
plot(xp,yp,'-g*');%plotagem gráfico solução exata.
hold on ;%utilizado para poder plotar mais de uma função no mesmo gráfico
plot(x,y,'-b*'); %plotagem gráfico Runge Kutta de 2ª ordem.
hold on;
plot(x1,y1,'-r*');%gráfico Runge Kutta de 3ª ordem.
legend('Valor exato','RK 2ªORDEM','RK 3ªORDEM','Location','NorthEastOutside');

%Tabela com as Saídas do método de 2ª ordem, comparação com valor exato e
%erro absoluto.
disp('-------------------------------------------------------------------------------------------------------------------------------------------')
disp('Resultado do método de Runge Kutta 2ª ordem')
disp('-------------------------------------------------------------------------------------------------------------------------------------------')
disp(['xRK    : ' num2str(x)]);
disp(['yRK    : ' num2str(y)]);
disp(['xExato : ' num2str(xp)]);
disp(['yExato : ' num2str(yp)]);
erro = abs(yp-y);
disp(['Erro   : ' num2str(erro)]);

%Tabela com as Saídas do método de 3ª ordem, comparação com valor exato e
%erro absoluto.
disp('-------------------------------------------------------------------------------------------------------------------------------------------')
disp('Resultado do método de Runge Kutta 3ª ordem')
disp('-------------------------------------------------------------------------------------------------------------------------------------------')
disp(['xRK    : ' num2str(x1)]);
disp(['yRK    : ' num2str(y1)]);
disp(['xExato : ' num2str(xp)]);
disp(['yExato : ' num2str(yp)]);
erro = abs(yp-y1);
disp(['Erro   : ' num2str(erro)]);


