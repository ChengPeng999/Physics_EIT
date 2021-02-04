J = 100;
N = 2*J;
a = -1;

x = linspace(0, 2*pi, 50);

subplot(1,2,1);
J_z = -J*cos(x);
D_jz = sqrt(J/2/N)*sin(x);
Z = (N/2 + J_z)/N;
plot(x,Z,x,Z+D_jz/2,x,Z-D_jz/2);
title('Fig.1 a)')

subplot(1,2,2);
J_z = 2*a/(1+a^2)*sqrt(J*(J+1)/2) *cos(x);
D_jz = sqrt(cos(x).^2*J*(J+1)/2*(1-4*a^2/(1+a^2)^2) +sin(x).^2*a^2/(1+a^2))/sqrt(N);
Z = (N/2 + J_z)/N;
plot(x,Z,x,Z+D_jz/2,x,Z-D_jz/2);
title('Fig.1 b)')


