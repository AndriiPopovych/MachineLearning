from fileSystem import *
import random

counter = 0
mseArr = []


def train(alpha=0.0001):
    print "start training"
    x, y = getDataFromCSV()
    tetta = initializationWeights(len(x[0]))
    x = meanNormalization(x)
    linearRegression(x, y, tetta, alpha)


def h(xArray, tettaArray):
    i = 0
    h = 0
    for x in xArray:
        h += float(x) * tettaArray[i]
        i += 1
    return h


def initializationWeights(n):
    tetta = []
    for i in range(n):
        tetta.append(random.uniform(-1.0 / n, 1.0 / n))
    return tetta


def meanNormalization(xArray):
    summ = []
    maxValue = []
    minValue = []
    meanValue = []
    sDeviation = []
    m = len(xArray)
    for item in xArray[0]:
        maxValue.append(item)
        minValue.append(item)
        summ.append(0)
    for x in xArray:
        i = 0
        for item in x:
            if maxValue[i] < item:
                maxValue[i] = item
            if minValue[i] > item:
                minValue[i] = item
            summ[i] += item
            i += 1
    for i in range(0, len(maxValue)):
        sDeviation.append(maxValue[i] - minValue[i])
        meanValue.append(float(summ[i]) / m)
    meanCoefficients = [sDeviation, meanValue]
    saveToJSONFile(meanCoefficients, "meanCoefficients.json")
    j = 0
    for x in xArray:
        i = 0
        for item in x:
            if sDeviation[i] != 0:
                xArray[j][i] = (xArray[j][i] - sDeviation[i]) / meanValue[i]
            i += 1
        j += 1
    return xArray


def linearRegression(xArray, yArray, tettaArray, alpha):
    _mse = 0
    while stopFunction(_mse):
        j = 0
        for tetta in tettaArray:
            tettaArray[j] = tetta - gradientDescend(xArray, yArray, tettaArray, alpha, j)
            j += 1
        _mse = mse(xArray, yArray, tettaArray)
        print _mse
        # print tettaArray
    saveData(tettaArray)


def gradientDescend(xArray, yArray, tettaArray, alpha, j):
    m = len(xArray)
    summ = 0
    i = 0
    for y in yArray:
        summ += (h(xArray[i], tettaArray) - y) * xArray[i][j]
        i += 1
    result = (alpha / m) * summ
    return result


def mse(xArray, yArray, tettaArray):
    m = len(xArray)
    summ = 0
    j = 0
    for y in yArray:
        hValue = h(xArray[j], tettaArray)
        summ += (hValue - y) * (hValue - y)
        j += 1
    _mse = 1.0 * summ / (2 * m)
    return _mse



