from train import *
from predict import *


def startTrain():
    arr = getDataFromCSV()
    x = arr[0]
    y = arr[1]
    alfa = 0.0001
    teta = train(x, y, alfa)
    saveData(teta)

startTrain()

print ("Success")
