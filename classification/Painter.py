from pylab import *


class Painter:
    def __init__(self):
        figure()
        pass

    def paintLine(self, x, y):
        plot(x, y)

    def addPoint(self, x, y, r='ro'):
        plot(x, y, r)

    def show(self):
        grid()
        show()
