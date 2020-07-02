function output_Forces = forces(config,n,Req,params)
%Input:
% config: configurations of the particles, a struct stores x1,x2,x3
%          p1,p2,p3...info
% n:number of particles
% Req: a constant of equilibrium distance, pre-assumed
% params: used for getting values of coefficients in different
%             potential formulas
% FORCES Calculates forces between n particles
% Output: 
% output_Forces:  2xn matrix where 
% output_Forcesij is the ith component of the force on
% the jth particle

   % symbolic values of locations (x,y)
   % along direction x1,y1, and x2,y2, only 2 directions
   
    syms xi yi xj yj
    syms x1 y1 x2 y2;
    % distance Rij btw i,j particle
    Rij(x1,y1,x2,y2) = sqrt((x1-x2)^2 + (y1-y2)^2);
    
    % Case 1: Springlike potential proportional to d^2
    % Req a constant
    Vij(x1,y1,x2,y2) = (Rij(x1,y1,x2,y2) - Req)^2;

    
    
    % Case 2: Lennard Jones potential
    % assume epsilon = 0.3
    
    % epsilon = params.LJ_potential_epsilon;
    % Vij(x1,y1,x2,y2) = epsilon * ((Req/Rij)^(12) - (Req/Rij)^6);
    
    
 
    % Case 3: Coulumblike potential, inverse of d^2
    % that makes sense, changed back with a coefficient k
    % k * 1/Rij
    
    % k = params.Coulumb_potential_coefficient;
    % Vij(x1,y1,x2,y2) = k * (1/Rij(x1,y1,x2,y2));
   
    
    
    
    % Case 4: a random class-mentioned potential with 1/(d^2)
    % not sure for realistic examples...
    
    % d = Rij(x1,y1,x2,y2) - Req;
    % Vij(x1,y1,x2,y2) = 1/(d^2);
    
    
    
    % Calculates forces
    % force is derivative of potential
    d1 = diff(Vij,1,x1);
    d2 = diff(Vij,1,y1);

    f(xi,yi,xj,yj) = [d1(xi,yi,xj,yj) d2(xi,yi,xj,yj)];
    
    % initialize output_Forces
    output_Forces = zeros(2,n);

for i=1:n
    for j=i:n
          if i~=j
             Fij =f(config.x1(i),config.x2(i),config.x1(j),config.x2(j))';
             output_Forces(:,i) = output_Forces(:,i) + Fij;
             output_Forces(:,j) = output_Forces(:,j) - Fij;
          end  
    end  
end

end

