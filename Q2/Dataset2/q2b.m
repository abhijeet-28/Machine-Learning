im=load('temp.txt');
size(im)
for i=[1:5]
    tmpimage=im(:,i);
    size(tmpimage)
    imagetodisp=vec2mat(tmpimage,92);
    size(imagetodisp)
    %imagetodisp=imagetodisp*255/(maxelem-minelem)
    %imshow(uint8(imagetodisp))
    maxelem=max(imagetodisp(:));
    minelem=min(imagetodisp(:));
    imagetodisp=double((imagetodisp-minelem)*255)/double(maxelem-minelem);
    
    imshow(uint8(imagetodisp))
    pause(2)
    figure,
    drawnow;
  
    
   

end

meanconverted=reshape(mean',1,[]);
projectionmatrix=(X-meanconverted)*im
%dlmwrite('project.txt',projectionmatrix);
save('projectionmatrix.txt', 'projectionmatrix', '-ASCII');

