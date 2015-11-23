A = [3;4;5;3;6];
B = fliplr(A');
C = cumsum(B);
D = fliplr(C)';

H = sum(A)/2 - D;
H = [H;sum(A)/2];


