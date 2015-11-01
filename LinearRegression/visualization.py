import pylab
from matplotlib import mlab

def visualizate(X = [], Y = [], otherX = [], otherY = []):
	xlist = X # mlab.frange (xmin, xmax, dx)

	ylist = Y


	pylab.plot (xlist, ylist)
	i = 0
	for point in otherX :
		pylab.plot(point[1], otherY[i], "x")
		i += 1
	pylab.show()