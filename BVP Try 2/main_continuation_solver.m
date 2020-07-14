function output = main_continuation_solver

% Initial conditions for x and p  

%EXAMPLE: TWO PARTICLES
% one at origin, one at the top of circle
%x0 = [0 0 0; 0 1/pi pi];
%p0 = [0 0 2*pi; 0 0 2*pi];
%n = 2;
%L = [0.5 0.5];

% one at origin, one at the side of circle
x0 = [0 0 0; -0.5/pi 0.5/pi -pi/2];
p0 = [0 0 2*pi; 0 0 2*pi];
n = 2;
L = [0.75 0.25];

%starting from Req 3
%x0 = [0 0 0; 0 0.4274 3.1416];
%p0 = [0 257.2647 22.7037; 0 -257.2647 22.7037];
%n=2;
%L = [0.5 0.5];



%EXAMPLE: 3 PARTICLES

%starting
%x0 = [0 0 0; 0.1358 0.2320 2.1187; -0.1406 0.2337 4.2247];
%p0 = [-0.1170 -0.2032 6.2712;0.2336 0.0107 6.2704;-0.1185 0.1974 6.2715];
%n = 3;
%L = [0.33 0.33 0.33];


%EXAMPLE: 4 PARTICLES

%x0 = [0 0 0;0.5/pi 0.5/pi pi/2;0 1/pi pi; -0.5/pi 0.5/pi -pi/2];
%p0 = [0 0 2*pi; 0 0 2*pi;0 0 2*pi;0 0 2*pi];
%n = 4;
%L = [0.25 0.25 0.25 0.25];


% EXAMPLE: 4 PARTICLES randomly generated IC
% randomly generate L s.t. sumL = 1
% x0 = rand(4,3);
% p0 = 3*rand(4,3);
% n = 4;
% l1 = rand(1,1);
% l2 = rand(1,1) * (1 - l1);
% l3 = rand(1,1) * (1 - l1 - l2);
% l4 = 1 - l1 - l2 - l3;
% L = [l1 l2 l3 l4];

% Arclength
s = 1;

% Define parameters
params = parameters;

% List of Desired boundary condition for x(tf)
%Reqs = [0.5*sqrt(2)/pi];
Reqs = linspace(0.5*sqrt(2)/pi, 0, 50);
%Reqs =  linspace(1/pi,3,50);

% Solve the continuation problem
output = solve_continuation(x0,p0,n,L,s,Reqs, params);

end