a = 0:0.01:1;

figure('Name', 'csma_performance')
plot(a, 1./(1+ 3.44 * a), 'LineWidth', 5)
title({'Limite da percentagem de uso do canal para transmitir informaçao', ...
       'em funçao do tempo ocupado para cada transmissao'})
xlabel('a (t/T) (Duty-cycle da transmissao)'), ylabel('Percentagem de uso do canala para transmitir informaçao')
grid on

saveNamedImg('./', 'png', true)
    
