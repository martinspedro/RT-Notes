N = linspace(1, 1e4, 1e4);

figure('Name', 'point_to_point_links')
plot(N, (N.^2 - N)/2, 'LineWidth', 5)
title('Evolução do Nº de ligações físicas ponto a ponto com o número de dispositivos em rede')
xlabel('N'), ylabel('Nº de ligações')
grid on

saveNamedImg('./', 'png', true)

