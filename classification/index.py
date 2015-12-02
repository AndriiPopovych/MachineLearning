from Perseptron import *

obj = Perceptron()
# or
obj.setData([[1, 1], [0, 1], [1, 0], [0, 0]], [1, 1, 1, -1])
obj.initWeight()
obj.calculate()
print (obj.w)