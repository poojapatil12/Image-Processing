function Relabel_Img(image1, closeBW2, Thresh1, Thresh2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here'
w = 1;
[M, N] = size(image1);
for i = 1:M
    for j = 1:N
        if (closeBW2(i,j) >= Thresh1)
            [Num, IMean, IStd] = Relabel_Reg(image1,closeBW2,i,j);
            if((image1(i,j) < min(IMean + IStd, Thresh2)) & (Num > 0))
                image1(i,j) = 1;
            else
                image1(i,j) = 0;
            end
            i = i + w;
            j = j + w;
        end
         if(closeBW2(i,j) == 0)
                image1(i,j) = 1;
         end
         if(closeBW2(i,j) == 1)
                image1(i,j) = 0;
            i = i + w;
            j = j + w;
        end
 
    end
end

figure, imshow(image1);
end

