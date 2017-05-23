X=[]
summ=zeros(50,37);
totalnum=0;
files = dir('lfw_easy/');
dirFlags = [files.isdir];
subFolders = files(dirFlags);
labels=[];


for k = 3 : length(subFolders)
	
    foldername=['lfw_easy/' subFolders(k).name];
    Imgs = dir([foldername '/' '*.jpg']);
    NumImgs = size(Imgs,1);
    for j =[1:NumImgs]
        labels=[labels;k-2]
        totalnum=totalnum+1;
        filename=[foldername '/' Imgs(j).name];
        image = double(imread([foldername '/' Imgs(j).name]));
        [m n]=size(image);
        summ=summ+image;
        temp=[];
        
        for i=[1:50]
        for j=[1:37]
            temp=[temp image(i,j,1) image(i,j,2) image(i,j,3)];
        end
        end
        size(temp);
       
        X=[X;temp];
        
        

        %imshow(uint8(image))
        
    end
end
dlmwrite('images.txt', X,',');
summ=summ/totalnum;
imshow(uint8(summ));
mean=[]
for i=[1:50]
        for j=[1:37]
            mean=[mean summ(i,j,1) summ(i,j,2) summ(i,j,3)];
        end
        end
totalnum
 [U,S,V] = svd(X-mean);
 k=50;
 reqvals=V(:,1:k);
 size(reqvals);

 save('temp.txt', 'reqvals', '-ASCII');
dlmwrite('label.txt',labels,',');

