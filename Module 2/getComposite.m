function V = getComposite(ch)
% All units in GPa and Poisson's ratio has no unit
% V = [Ef,Em,vf,vm,Gf,Gm]
if(ch==1)
    V = [70,3.5,0.2,0.35,30.19,1.83];
end
if(ch==2)
    V = [250,3.5,0.2,0.35,9,1.83];
end
if(ch==3)
    V = [140,3.5,0.2,0.35,2.9,1.83];
end
if(ch==4)
    V = [350,70,0.2,0.33,170,26.12];
end
