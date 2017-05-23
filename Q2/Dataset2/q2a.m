X=[]
summ=zeros(112,92)
totalnum=0
for i=[1:40]
    foldername=['orl_faces/s' int2str(i)]
    Imgs = dir([foldername '/' '*.pgm']);
    NumImgs = size(Imgs,1);
    for j =[1:NumImgs]
        totalnum=totalnum+1;
        image = double(imread([foldername '/' Imgs(j).name]));
        [m n]=size(image);
        summ=summ+image;
        tmp=reshape(image', 1, []);
        size(tmp);
        X=[X;tmp];
        
        

        %imshow(uint8(image))
        
    end
end

dlmwrite('images.txt', X,',');
summ=summ/totalnum;
imshow(uint8(summ));
mean=reshape(summ', 1, []);

[U,S,V] = svd(X-mean);
k=50;
reqvals=V(:,1:k);
size(reqvals);

save('temp.txt', 'reqvals', '-ASCII');


