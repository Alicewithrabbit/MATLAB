function de = defun(t,e)

de1 = e(2);
K = 4;
T = 20;
de2 = -(de1 + K*e(1))/T;

de = [de1;de2];


end