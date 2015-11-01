#import math
#import pylab
#from matplotlib import mlab
#import random


tetta = [1, 1]
alpha = 0.01
x = []
#x = [
#	[1, 1],
#	[1, 3],
#	[1, 5],
#	[1, 7]
#]
k = 0
y = []
for num in range(0,50):
	rnd = random.randint(1,40) 
	x.append([1, rnd])
	y.append(random.randint(5,10))
m = len(x)
#y = [7, 11, 15,30]
newTetta = [1, 1]
tmblr = 1
counter = 0
while tmblr == 1:
	j = 0
	while j < 2:
		i = 0
		summ = 0
		while i < m:
			f = (tetta[0]*x[i][0] + tetta[1]*x[i][1])
			summ += (f-y[i])*x[i][j]

			i += 1
		newTetta[j] = tetta[j] - alpha*summ/m
		j += 1 
	tetta[0] = newTetta[0]
	tetta[1] = newTetta[1]

	counter += 1
	if counter > 100000:
		print tetta[0] + tetta[1]*4
		print tetta
		tmblr = 0


def func (x):
    global tetta
    res = tetta[0] + tetta[1]*x
    return res

xmin = -20.0
xmax = 20.0
dx = 0.01

 
xlist = [0,100] # mlab.frange (xmin, xmax, dx)


ylist = [func (val) for val in xlist]


pylab.plot (xlist, ylist)
i = 0
for point in x :
	pylab.plot(point[1], y[i], "x")
	i += 1
pylab.show()