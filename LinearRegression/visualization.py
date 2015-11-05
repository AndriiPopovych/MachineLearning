import pylab
from mpl_toolkits.mplot3d import Axes3D
import numpy


def makeData(x, y):
    xgrid, ygrid = numpy.meshgrid(x, y)
    zgrid = xgrid + ygrid/2 #numpy.sin(xgrid) * numpy.sin(ygrid) / (xgrid * ygrid)
    return xgrid, ygrid, zgrid


def visualization(x, y, z):
    x, y = numpy.meshgrid(x, y)
    print x
    print y
    fig = pylab.figure()
    axes = Axes3D(fig)
    axes.plot_surface(x, y, z)
    pylab.show()


# a = range(1, 10)
# b = range(96, 106)
# c = range(1,10)
# vizializate(a,b,c)
# x, y, z = makeData()
