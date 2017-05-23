pmatrix=load('projectionmatrix.txt');
im=load('temp.txt');
size(im)
size(pmatrix)

 prompt = '';
 id = input(prompt);
%
% folderindex=floor((id-1)/10)+1
% foldername=['orl_faces/s' int2str(folderindex)]
% Imgs = dir([foldername '/' '*.pgm']);
% imageindex=rem((id-1),10)+1;
% image = double(imread([foldername '/' Imgs(imageindex).name]));
proj=pmatrix(id,:);
size(proj);
 projectedimage=proj*im';
 size(projectedimage);
 
 dispimg=zeros(50,37,3);
     size(dispimg)
        cnt=1;
        for i=[1:50]
            for j=[1:37]
                for k=[1:3]
                    dispimg(i,j,k)=projectedimage(1,cnt);
                    cnt=cnt+1;
                end
            end
        end
 
 
 finalimage=dispimg;
% 
    maxelement=max(finalimage(:));
    minelement=min(finalimage(:));
    finalimage=double((finalimage-minelement)*255)/double(maxelement-minelement);
imshow(uint8(finalimage));



%imshow(uint8(finalimage))


%end
