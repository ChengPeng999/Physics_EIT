J = 50;
N = 2*J;


x = linspace(0, 2*pi, 1000);

subplot(3,2,1);
a = -0.9;
J_z = 2*a/(1+a^2)*sqrt(J*(J+1)/2) *cos(x);
D_jz = sqrt(cos(x).^2*J*(J+1)/2*(1-4*a^2/(1+a^2)^2) +sin(x).^2*a^2/(1+a^2))/sqrt(N);
Z = (N/2 + J_z)/N;
plot(x,Z,x,Z+D_jz/2,x,Z-D_jz/2);

subplot(3,2,2);
d_phi = abs(D_jz ./ gradient(J_z).*(2*pi/1000));
semilogy(x,d_phi);

subplot(3,2,3);
a = -1.0;
J_z = 2*a/(1+a^2)*sqrt(J*(J+1)/2) *cos(x);
D_jx = a/sqrt(1+a^2);
D_jz = sqrt(cos(x).^2*J*(J+1)/2*(1-4*a^2/(1+a^2)^2) +sin(x).^2*a^2/(1+a^2))/sqrt(N);
Z = (N/2 + J_z)/N;
plot(x,Z,x,Z+D_jz/2,x,Z-D_jz/2);


subplot(3,2,4);
d_phi = abs(D_jz ./ gradient(J_z).*(2*pi/1000));
semilogy(x,d_phi);

subplot(3,2,5);
a = -1.1;
J_z = 2*a/(1+a^2)*sqrt(J*(J+1)/2) *cos(x);
D_jx = a/sqrt(1+a^2);
D_jz = sqrt(cos(x).^2*J*(J+1)/2*(1-4*a^2/(1+a^2)^2) +sin(x).^2*a^2/(1+a^2))/sqrt(N);
Z = (N/2 + J_z)/N;
plot(x,Z,x,Z+D_jz/2,x,Z-D_jz/2);

subplot(3,2,6);
d_phi = abs(D_jz ./ gradient(J_z).*(2*pi/1000));
semilogy(x,d_phi);

