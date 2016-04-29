function [Thresh1, Thresh2] = Shannon2D( p, image )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
maxValue = 0;
Thresh1 = 0;
Thresh2 = 0;

for T1=1:254
    for T2=T1+1:254
        b = p(1:T1);
        bw = p(T1+1:T2);
        w = p(T2+1:255);
        Pb = sum(p(1:T1));
        Pbw = sum(p(T1+1:T2));
        Pw = sum(p(T2+1:255));
        HW = -sum((w/(Pw+0.001)).*log((w+0.001)/(Pw+0.001)));
        HB = -sum((b/(Pb+0.001)).*log((b+0.001)/(Pb+0.001)));
        HBW = -sum((bw/(Pbw+0.001)).*log((bw+0.001)/(Pbw+0.001)));
        total = HW + HB + HBW;
        total = abs(total);
        if total > maxValue
            maxValue = total;
            Thresh1 = T1;
            Thresh2 = T2;
        end
    end
end
% Thresh1
% Thresh2
% bw1 = image > Thresh1;
% bw2 = image > Thresh2;
% figure(1),imshow(bw1);
% figure(2), imshow(bw2);
end

