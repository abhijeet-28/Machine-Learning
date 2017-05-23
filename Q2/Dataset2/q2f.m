pmatrix=load('projectionmatrix.txt');
im=load('temp.txt');
size(im)
size(pmatrix);

allprojected=pmatrix*im';
dlmwrite('pro.txt',allprojected,',');
size(allprojected)

prompt = '';
 id = input(prompt);
folderindex=floor((id-1)/10)+1
foldername=['orl_faces/s' int2str(folderindex)]
Imgs = dir([foldername '/' '*.pgm']);
imageindex=rem((id-1),10)+1;
image = double(imread([foldername '/' Imgs(imageindex).name]));
proj=pmatrix(id,:);
size(proj)
projectedimage=proj*im';
size(projectedimage);
finalimage=vec2mat(projectedimage,92);

    maxelement=max(finalimage(:));
    minelement=min(finalimage(:));
    finalimage=double((finalimage-minelement)*255)/double(maxelement-minelement);
imshow(uint8(image));
pause(2)
figure,

imshow(uint8(finalimage))




