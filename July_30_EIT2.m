%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EIT in adiabatic limit, Schrodinger Equation, Input-output formalism
%
% Reproduce Fig.5 of ?How to Trap Photons? Storing Single-Photon Quantum States in Collective Atomic Excitations.? 
%   by Fleischhauer, M., S.F. Yelin, and M.D. Lukin.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Time
t = (-5:0.0001:35);
dt = t(2)-t(1);
% Characteristic time
T = 1;

% Empty cavity decay rate
gamma = 4;

% cos theta as a function of t, theta is the mixing angle
CosTheta = sqrt(2/gamma/T)*sech(2*t/T)./sqrt(1+tanh(2*t/T)) + sqrt(2/gamma/T)*sech(-2*(t-30)/T)./sqrt(1+tanh(-2*(t-30)/T));

% Input and Output field
Input = sqrt(1/T)*sech(2*(t)/T);
Output = zeros(1,length(t));
% Dark state
D = zeros(1,length(t));

for jj = 2:length(t)
    D(jj) = D(jj-1) + dt*( sqrt(gamma)*CosTheta(jj)*Input(jj-1) - gamma/2*CosTheta(jj)^2*D(jj-1));
    Output(jj) = Input(jj) - sqrt(gamma)*CosTheta(jj)*D(jj-1);
end

subplot(2,1,1),plot(t,CosTheta, t,Input, 'LineWidth',1.2);
set(gca,'xLim',[min(t) max(t)],'yLim',[0 1],'Linewidth',1.4,'FontSize',16);
xlabel('\fontsize{16}Time \itt ');
ylabel('\fontsize{16}Relative intensity');
legend('cos \theta','Input','Location','best')

subplot(2,1,2),plot(t,-Output, t,D, 'LineWidth',1.2);
set(gca,'xLim',[min(t) max(t)],'yLim',[0 1],'Linewidth',1.4,'FontSize',16);
xlabel('\fontsize{16}Time \itt ');
ylabel('\fontsize{16}Relative intensity');
legend('Output','Dark','Location','best')






