from train import *
from predict import *
# 852,2,179900
# 1852,4,299900
# 1203,3,239500
# print (predict(852, 2))
# print (predict(1852, 4))
# print (predict(1203, 3))

def startTrain():
    arr = getDataFromCSV()
    x = arr[0]
    y = arr[1]
    alfa = 0.0001
    teta = train(x, y, alfa)
    saveData(teta)

startTrain()

# makeData()

print ("Success")
