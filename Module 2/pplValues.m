function V = pplValues(Ef,Em,vf,vm,Gf,Gm,Vf)
%Compute values of EL,ET,vLT,GLT using the basic equations
%   Using the rule of mixtures and Halpin Tsai Equations
EL = Ef*Vf+Em*(1-Vf); % Rule of mixtures

eta = ((Ef/Em)-1)/((Ef/Em)+2); %Circular cross sections 
ET = Em*((1+2*eta*Vf)/(1-eta*Vf)); %Halpin Tsai for ET

eta1 = ((Gf/Gm)-1)/((Gf/Gm)+1);
GLT = Gm*((1+eta1*Vf)/(1-eta1*Vf));

vLT = vf*Vf + vm*(1-Vf);

V = [EL,ET,GLT,vLT];
end

