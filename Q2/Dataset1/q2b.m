im=load('temp.txt');
size(im)
 for i=[1:5]
     tmpimage=im(:,i);
     size(tmpimage)
     maxelem=max(tmpimage(:));
     minelem=min(tmpimage(:));
     imagetodisp=zeros(50,37,3);
     size(imagetodisp)
        cnt=1;
        for i=[1:50]
            for j=[1:37]
                for k=[1:3]
                    imagetodisp(i,j,k)=tmpimage(cnt,1);
                    cnt=cnt+1;
                end
            end
        end
%     imagetodisp=vec2mat(tmpimage,92);
     size(imagetodisp)
     %imagetodisp=imagetodisp*255/(maxelem-minelem)
 %    imshow(uint8(imagetodisp))
%      maxelem=max(imagetodisp(:));
%      minelem=min(imagetodisp(:));
     imagetodisp=double((imagetodisp-minelem)*255)/double(maxelem-minelem);
%     
     imshow(uint8(imagetodisp))
     pause(2)
     figure,
     drawnow;
%   
%     
%    
% 
 end
% 
 
 projectionmatrix=(X-mean)*im
 save('projectionmatrix.txt', 'projectionmatrix', '-ASCII');
 mn=sum(projectionmatrix)/1288;
 nor=norm(projectionmatrix);
 projectionmatrix=(projectionmatrix-mn)/nor;
 dlmwrite('proj.txt',projectionmatrix,',');

