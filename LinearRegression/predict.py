from fileSystem import *

def predict(_x, _x1):
    arr = getDataFromCSV()
    x = arr[0]
    i = 0
    result = []
    # initialize array for saving values by numbers of fiches """ features* """
    arr = []
    for i in range(len(x[0])):
        arr.append([])
    for item in x:
        j = 0
        for elem in item:
            arr[j].append(elem)
            j += 1
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
