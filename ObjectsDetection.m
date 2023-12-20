clear all
close all

%  The aim of this code is to detect plots, label and retrieve the vertices of the rectangles that enclose each plot.

i1=imread('20191129_40m_RGB_CUT_GRID1_RGB_255.tif');
i1g=rgb2gray(i1);
bw1=im2bw(i1g);

stats=regionprops(bw1,'Perimeter','Area','Centroid','BoundingBox');

ndvi1=imread('20191129_40m_ndvi_CUT_BIN_027_FILTER_GRID1.tif');

figure(1),imshow(ndvi1);
hold on

for k=1:length(stats)
    thisboundingbox=stats(k).BoundingBox;   
    rectangle('Position',[thisboundingbox(1),thisboundingbox(2),thisboundingbox(3),thisboundingbox(4)],'EdgeColor','b','Linewidth',2);
    text(stats(k).Centroid(1),stats(k).Centroid(2),num2str(k),'Color','r','FontSize',5);
end


for k=1:length(stats)
    thisboundingbox=stats(k).BoundingBox;
    for j=1:4
        area(k,j)=thisboundingbox(j);
        area1(k,j)=round(area(k,j));
    end 
end

% area2: Saves the coordinates of the vertices of the rectangles of each plot, according to:
% area2(k,1) = area1(k,1) = X1
% area2(k,2) = area1(k,2) = Y1
% area2(k,3) = area1(k,1) + area1(k,3) = X2
% area2(k,4) = area1(k,4) + area1(k,2) = Y2

for k=1:length(stats)
    area2(k,1)=area1(k,1);%(x1)
    area2(k,2)=area1(k,2);%(y1)
    area2(k,3)=area1(k,3)+area1(k,1)-1;%(x2)
    area2(k,4)=area1(k,4)+area1(k,2)-1;%(y2)          
end
