y=load('label.txt');


correct=0
for i=[1:6]
    ind1=finalc(:,1)==i;
    matrix=y(ind1,:);
    size(matrix);
    
    mostocc=mode(matrix);
    correct=correct+sum(matrix==mostocc);
    
end
accuracy=(correct*100)/m
