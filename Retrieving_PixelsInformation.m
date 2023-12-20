%clear all
%close all

% This loop retrieves the information of each potato plot. It is represented as an image (Y,X) starting from (1,1)

cer1(1:length(stats))=0;       
nul1(1:length(stats))=0;    
plan1(1:length(stats))=0;  

for k=1:length(stats)
   
    n=1;% ESTO ES Y
    largorec(k)=area2(k,3)-area2(k,1)+1;
    %largorec(k): It is the length of rectangle that contains the object
    anchorec(k)=area2(k,4)-area2(k,2)+1;
    %anchorec(k): It is the width of rectangle that contains the object
    totpix1(k)=largorec(k)*anchorec(k);
    %Total Pixels of each reactangle detected
    
    ii=1;
    for i=1:area2(k,3)-area2(k,1)+1 % En la matriz el X es el Y
        
         m=1;%ESTO ES X
    
        for j=1:area2(k,4)-area2(k,2)+1 % En la matriz el Y es el X
            gri1(n,m,k)= ndvi1(j+area2(k,2)-1,i+area2(k,1)-1);
            
            if gri1(n,m,k)<0                
                nul1(k)=nul1(k)+1;
                % nul(k): Pixels inside the rectangle detected without data
            elseif gri1(n,m,k)==0
                cer1(k)= cer1(k)+1;
            end
            
            if gri1(n,m,k)>0
                grif1(ii,k) = gri1(n,m,k);
                %grif1: Matrix with information corresponding to vegetation. However, It can have ceros.  
                plan1(k)=plan1(k)+1;
                %plan1(k): number of pixels corresponding to vegetation  
                ii=ii+1;
            end
            
                       
            m=m+1;% ESTO ES X
        end
        n=n+1;
    end    
end


% gri1 : These are the vertices of the detected rectangles. 
% They enclose the plots and saves the information per pixel of each of the rectangles (object detectors)

totalpix1=n*m;
%totalpix: it is the MAXIMUM total number of pixels in grid 1
