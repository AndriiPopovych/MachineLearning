import pylab
from matplotlib import mlab

def train(x, y, tetta, alpha):
	print "start training..."
	x = futureScaling(x)
	m = len(x)
	tmblr = 1
	counter = 0
	newTetta = initializationWeights(x)
	q = 0
	while tmblr == 1:
		mse = 0
		j = 0
		while j < len(x[0]):
			i = 0
			summ = 0
			while i < m:
				l = 0
				f = 0
				for num in tetta:
					f += num*x[i][l] #calculate summ h(x)
					l += 1
				summ += (f-y[i])*x[i][j] # (h(x) - y(i))*x(i)(j)
				mse = alpha*summ/m # minimum square error
				i += 1
			newTetta[j] = tetta[j] - mse
			if q == 100:
				pylab.plot(counter, mse, "x")
				q = 0
			q += 1
			j += 1 
		k = 0
		for tet in newTetta:
			tetta[k] = tet
			k = k + 1

		counter += 1
		print counter
		if counter > 100000:
			pylab.show()
			print "mse:"
			print mse
			#print "End..."
			return tetta

def initializationWeights(x):
	tetta = []
	for item in x[0]:
		tetta.append(1)
	return tetta

def futureScaling(x):
	i = 0
	result = []
	arr = [[],[],[]]
	for item in x:
		j = 0
		for elem in item:
			arr[j].append(elem)
			j = j + 1
	index = 0
	maxValue = []
	for elem in arr:
		maxValue.append(max(elem))
	i = 0
	for item in x:
		j = 0
		for elem in item:
			x[i][j] = float(x[i][j])/float(maxValue[j])
			j = j + 1
		i += 1
	return x