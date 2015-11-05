from train import *
from predict import *
from visualization import *

# print (predict(1600, 3))

def startTrain():
    arr = getDataFromCSV()
    x = arr[0]
    y = arr[1]
    alfa = 0.001
    teta = train(x, y, alfa)
    saveData(teta)

startTrain()

# makeData()

print ("Success")
