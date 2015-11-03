from fileSystem import *
from train import *
from visualization import *
import timeit


def get(_x, _x1):
    arr = getDataFromCSV()
    x = arr[0]
    i = 0
    result = []
    # initialize array for saving values by numbers of fiches
    arr = []
    for i in range(len(x[0])):
        arr.append([])
    for item in x:
        j = 0
        for elem in item:
            arr[j].append(elem)
            j = j + 1
    index = 0
    maxValue = []
    # find max value in each values by numbers of fitches
    for elem in arr:
        maxValue.append(max(elem))
    _x = float(_x) / float(maxValue[1])
    _x1 = float(_x1) / float(maxValue[2])

    arr = getFileContents("teta.csv").split(",")
    tetta = [0, 0, 0]
    tetta[0] = float(arr[0])
    tetta[1] = float(arr[1])
    tetta[2] = float(arr[2])
    print (tetta)
    result = tetta[0] + tetta[1] * _x + tetta[2] * _x1
    return result


def startTrain():
    arr = getDataFromCSV()
    x = arr[0]
    y = arr[1]
    alfa = 0.0001
    # meanNormalization(x)
    teta = train(x, y, alfa)
    saveData(teta)


def startVisualisation():
    x = [1, 30]
    y = [get(x[0]), get(x[1])]
    arr = getDataFromCSV()
    otherX = arr[0]
    otherY = arr[1]
    visualizate(x, y, otherX, otherY)


startTrain()
# print (get(2104, 3))
print ("Success")
