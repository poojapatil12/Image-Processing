%read grayscale of image
image1 = im2double( imread('H04.bmp'));

%image2 = imread('H04.bmp');
%imshow(image1);
image1 = rgb2gray(image1);
 
%image2 = rgb2gray(image2);
nbins = 256; % Number of bins
[hist1,h] = imhist(image1,nbins); 
%[hist2,h1] = imhist(image2,nbins);
p1 = hist1 ./ sum(hist1); % Probabilities
%p2 = hist2 ./ sum(hist2);
se = strel('disk',15);

closeBW = imclose(image1,se);

closeBW2 = imsubtract(closeBW, image1);
%figure, imshow(closeBW2)
%hist1 = hist1 / sum(h);
[Thresh1, Thresh2] = Shannon2D(p1, image1);
Thresh1 = Thresh1/256;
Thresh2 = Thresh2/256;
 Thresh1;
 Thresh2;
[M N] = size(closeBW2);
for i = 1:M
    for j = 1:N
        if(closeBW2(i,j) <= Thresh1)
            closeBW2(i,j) = 1;
            %image1(i,j) = 0;
        end
        if(closeBW2(i,j) >= Thresh2)
                closeBW2(i,j) = 0;
                %image1(i,j) = 1; 
        end
    end
end
% closeBW2(closeBW2 < Thresh1) = 255;
% closeBW2(closeBW2 > Thresh2) = 0;
figure, imshow(image1);
% Thresh1
% Thresh2
%%Relabel_Img(image1, closeBW2, Thresh1, Thresh2);
% entropies = zeros(256,1);
% % first image
%calThreahold(p1,image1);
% 
% % secong image
% %calThreahold(p2,image2);
% 
% for t=1:254
%     White = hist1(1:t);
%     Black = hist1(t+1:255);
%     
%     HB =  sum((Black/(0.001+sum(Black))).*log((Black+0.001)/(0.001 +sum(Black))));
%     HW =  sum((White/(0.001+sum(White))).*log((White+0.001)/(0.001 +sum(White))));
%     entropies(t) = HB+HW; 
%    % w1=sum(p(T+1:255));
%     % u0=dot(log((p(1:T)/w0)),p(1:T))/w0;
% 
%     %u1=dot(log((p(T+1:255)/w1)),p(T+1:255))/w1;
% 
% %     sigma=((-u1-u0));
% %     if sigma>max
% %         max=sigma;
% %         threshold=T-1;
% %     end
% end
% 
% [~, T] = max(abs(entropies)); % The Maximal entropy determines the threshold.
% T = T - 1;
% A = image1 > T;
% imshow(A);