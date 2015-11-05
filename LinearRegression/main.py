from train import *
from predict import *
from visualization import *

#startTrain()
# print (predict(1600, 3))

def startTrain():
    arr = getDataFromCSV()
    x = arr[0]
    y = arr[1]
    alfa = 0.0001
    teta = train(x, y, alfa)
    saveData(teta)


# makeData()

print ("Success")
