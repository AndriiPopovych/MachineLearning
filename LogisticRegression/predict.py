from fileSystem import *
from train import meanNormalization
import math


def calculate(_xArray):
    tettaData = getFileContents("tetta.csv")
    meanCoefficients = getFileJSONContents("meanCoefficients.json")
    sDeviation = meanCoefficients[0]
    meanValue = meanCoefficients[1]
    tetta = tettaData.split(",")
    xArray = [] #[(1.0 - float(sDeviation[0])) / float(meanValue[0])]
    i = 0
    for x in _xArray:
        xArray.append((float(x) - float(sDeviation[i])) / float(meanValue[i]))
        i += 1
    i = 0
    summ = 0
    for t in tetta:
        summ += xArray[i] * float(t)
        i += 1
    result = 1 / (1 + math.exp(-summ))
    return result


def predict():
    xArray, yArray = getDataFromCSV("predict.csv")
    i = 0
    trueValue = 0
    falseValue = 0
    for x in xArray:
        predictResult = calculate(x)
        predictResult = round(predictResult)
        if predictResult == yArray[i]:
            trueValue += 1
        else:
            falseValue += 1
        i += 1
    print "True/False = " + str(trueValue) + "/" + str(falseValue)


