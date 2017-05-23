from sklearn import svm
from sklearn.model_selection import cross_val_score

import numpy as np
fileopen=open("attr.txt",'r')
data=np.loadtxt(fileopen)


fileopen2=open("label.txt",'r')
labels=np.loadtxt(fileopen2)


classifier=svm.LinearSVC()
print "done"
scores=cross_val_score(classifier,data,labels, cv=10)
print scores