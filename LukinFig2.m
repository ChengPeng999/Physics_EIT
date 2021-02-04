% define the varibles & functions
theta = @(x) acot(100.*(1 -0.5.*tanh(0.1 .*(x-15)) +0.5 .*tanh(0.1 .*(x-125))));
fun = @(x) (cos(theta(x))).^2;
F = @(k) integral(fun,0,k);

% resolution
nx = 100;
nt = 50;

% max time
T = 150;

% x, t axis
t = linspace(-10,T,nt);
x = linspace(-20,120,nx);

% goal varibles
phi = zeros(nt,nx);
E = zeros(nt,nx);
S = zeros(nt,nx);

for i = 1:nt
    phi(i,:) = envelope(x,F(i/nt*T));
    E(i,:) = sin(theta(i/nt*T)) .* phi(i,:);
    S(i,:) = cos(theta(i/nt*T)) .* phi(i,:);
end

% plot the diagram
subplot(2,2,1)
plot(t,theta(t)/pi*2,t,cot(theta(t))/100);

subplot(2,2,2)
meshz(x,t,phi);

subplot(2,2,3)
meshz(x,t,S);

subplot(2,2,4)
meshz(x,t,E);

% wave packeage
function a = envelope(x, d)
    a = exp(-((x-d)/10).^2);
end


