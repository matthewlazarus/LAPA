clear; clc; clear all; close all;
nx=10;
ny=15;
V= zeros(ny,nx);
V(:,1)=1;
figure;
contourf(V)
maxIterations = 10;
useImageFilter = false;

if useImageFilter
    V=imboxfilt(V,3);
    contourf(V);
else
    for iterations = 1:maxIterations
        for xCount = 1:size(V,2)
            for yCount=1:size(V,1)
                if(yCount >1 && yCount<size(V,1) && xCount>1 && xCount < size(V,2) )
                    V(yCount, xCount) = (V(yCount+1, xCount) +V(yCount-1, xCount)+V(yCount, xCount+1)+V(yCount, xCount-1))/4;
                elseif(yCount ==1 && xCount>1 && xCount < size(V,2))
                    V(yCount, xCount) = (V(yCount+1, xCount) +V(yCount, xCount+1)+V(yCount, xCount-1))/3;
                elseif(yCount ==size(V,1) && xCount>1 && xCount < size(V,2))
                    V(yCount, xCount) = (V(yCount-1, xCount) +V(yCount, xCount+1)+V(yCount, xCount-1))/3;
                end
            end
        end
        contourf(V)
        drawnow;
    end
end

nx=10;
ny=15;
V= zeros(ny,nx);
V(:,1)=1;
V(:,nx)=1;
figure;
contourf(V)
maxIterations = 10;


if useImageFilter
    V=imboxfilt(V,3);
    contourf(V);
else    
    for iterations = 1:maxIterations
        for xCount = 1:size(V,2)
            for yCount=1:size(V,1)
                if(yCount >1 && yCount<size(V,1) && xCount>1 && xCount < size(V,2) )
                    V(yCount, xCount) = (V(yCount+1, xCount) +V(yCount-1, xCount)+V(yCount, xCount+1)+V(yCount, xCount-1))/4;
                end

            end
        end
        contourf(V)
        drawnow;
    end
end

[Ex, Ey]=gradient(V);
figure;
x = 1:nx;
y=1:ny;
quiver(x,y,Ex,Ey);


