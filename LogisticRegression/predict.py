from fileSystem import *
from pylab import *

tettaData = getFileContents("tetta.csv")
tetta = tettaData.split(",")
meanCoefficients = getFileJSONContents("meanCoefficients.json")

def calculate(xArray):
    i = 0
    summ = 0
    for t in tetta:
        summ += float(xArray[i]) * float(t)
        i += 1
    # print summ
    result = 1.0 / (1.0 + math.exp(-summ))
    # print resu
    return result


def predict():
    sDeviation = meanCoefficients[0]
    meanValue = meanCoefficients[1]
    i = 0
    xArray, yArray = getDataFromCSV("predict.csv")
    j = 0
    # mean normalization
    for t in tetta:
        i = 0
        for x in xArray:
            xArray[i][j] = (float(x[j]) - float(sDeviation[j])) / float(meanValue[j])
            i += 1
        j += 1
    i = 0
    trueValue = 0
    falseValue = 0
    visualize()
    countOne = 0
    print xArray
    for x in xArray:
        predictResult1 = calculate(x)
        predictResult = round(predictResult1)
        if predictResult == 1:
            countOne += 1
        if predictResult == yArray[i]:
            # plot([x[1]], [predictResult1], 'x')
            plot([i], [predictResult1], 'x')
            trueValue += 1
        else:
            # plot([x[1]], [predictResult1], 'ro')
            plot([i], [predictResult1], 'ro')
            falseValue += 1
        i += 1
    print "True/False = " + str(trueValue) + "/" + str(falseValue)
    print "count one = " + str(countOne)
    show()


def visualize():
    # x = linspace(-1, 1, 3)
    x = []
    i = -5
    while i <= 5:
        i += 0.01
        x.append(i)
    y = []
    for _x in x:
        y.append(1 / (1 + math.exp(0 - _x)))
    figure()
    plot(x, y, 'r')
    plot([0, 0], [0, 1])
    plot([-6, 6], [0.5, 0.5])
    xlabel('x')
    ylabel('y')