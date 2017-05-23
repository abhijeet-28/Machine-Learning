from sklearn import svm
from sklearn.model_selection import cross_val_score


data=[]
fileopen=open("proj.txt",'r')
for line in fileopen:
	tm=[]
	xx=line.split(',')
	for alpha in xx:
		tm.append(float(alpha))
	xx=max(tm)
	yy=min(tm)
	tm=[(xy-yy)/(xx-yy) for xy in tm]
	data.append(tm)
label=[]

fileopen2=open("label.txt",'r')
for line in fileopen2:
	label.append(int(line))



classifier=svm.SVC(kernel='linear', C=1)

scores=cross_val_score(classifier,data,label, cv=10)
print scores.mean()