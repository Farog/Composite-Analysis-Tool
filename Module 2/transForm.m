function V = transForm(EL,ET,GLT,vLT,theta)
%Transforming the stress and strain to get Ex,Ey...

t = (cos(theta)^4)/EL + (sin(theta)^4)/ET + 0.25*(1/GLT - 2*vLT/EL)*sin(2*theta)^2;
Ex = 1/(t);

t = (sin(theta)^4)/EL + (cos(theta)^4)/ET + 0.25*(1/GLT - 2*vLT/EL)*sin(2*theta)^2;
Ey = 1/(t);

t = 1/EL + 2*vLT/EL + 1/ET - (1/EL + 2*vLT/EL + 1/ET - 1/GLT)*cos(2*theta)^2;
Gxy = 1/(t);

mx = sin(2*theta)*(vLT + EL/ET - EL/(2*GLT) - cos(theta)^2*(1 + 2*vLT + EL/ET - EL/GLT));
my = sin(2*theta)*(vLT + EL/ET - EL/(2*GLT) - sin(theta)^2*(1 + 2*vLT + EL/ET - EL/GLT));

vxy = Ex*( vLT/EL - 0.25*(1/EL + 2*vLT/EL + 1/ET - 1/GLT)*sin(2*theta)^2 );

V = [theta,Ex,Ey,Gxy,vxy,mx,my];
end

