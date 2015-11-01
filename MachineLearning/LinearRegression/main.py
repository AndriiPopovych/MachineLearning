from fileSystem import *
from train import *
from visualization import *
import timeit
#168412.115191,197301.090695,197301.090695 0,0001
#66875.0571291,533528.466264,533528.466264  0,001
#89595.4040109,623380.675327,623380.675327  0.01
def get(x):
	arr = getFileContents("teta.csv").split(",")
	tetta = [0, 0]
	tetta[0] = float(arr[0])
	tetta[1] = float(arr[1])
	result = tetta[0] + tetta[1]*x
	return result

def startTrain():
	arr = getDataFromCSV()
	x = arr[0]
	y = arr[1]

	alfa = 0.00005
	teta = [1,1,1]
	teta = train(x, y, teta, alfa)
	saveData(teta)	

def startVisualisation():
	x = [1, 30]
	y = [get(x[0]), get(x[1])]
	arr = getDataFromCSV()
	otherX = arr[0]
	otherY = arr[1]
	visualizate(x, y, otherX, otherY)

startTrain()

print "Success"