import pylab
from matplotlib import mlab
from visualization import *
import random
# meanNormalizations    231991.91236,68843.7688878,64626.0316494 -1.09
# futures scaling       164794.671843,115623.786246,127452.529832 -3.09
mseArr = []
t1 = []
t2 = []
z = []
counter = 0
def train(x, y, alpha):
    global  counter
    tetta = initializationWeights(x)
    print ("start training...")
    #x = futureScaling(x)
    x = meanNormalization(x)
    m = len(x)
    tmblr = 1
    newTetta = initializationWeights(x)
    q = 0
    while tmblr == 1:
        mse = 0
        j = 0
        while j < len(x[0]):
            i = 0
            summ = 0
            while i < m:
                l = 0
                f = 0
                for num in tetta:
                    f += num * x[i][l]  # calculate summ h(x)
                    l += 1
                summ += (f - y[i]) * x[i][j]  # (h(x) - y(i))*x(i)(j)
                mse = alpha * summ / m  # minimum square error
                i += 1
            newTetta[j] = tetta[j] - mse

            j += 1
        k = 0
        for tet in newTetta:
            tetta[k] = tet
            k = k + 1
        counter += 1
        if q == 100:
            t1.append(tetta[0])
            t2.append(tetta[1])
            z.append(mse)
            print (counter)
            #pylab.plot(counter, mse, "x")
            q = 0
        q += 1
        if stopFunction(mse) == True:
            visualization(t1, t2, z)
            # pylab.show()
            print ("mse:")
            print (mse)
            # print "End..."
            return tetta

def stopFunction(mse):
    global counter
    if counter > 100000:
        return True
    mseArr.append(mse)
    lenMse = len(mseArr)
    if ( (mseArr[lenMse - 1] - mseArr[lenMse - 2]) < 0.00001 and lenMse > 2):
        # print mseArr
        return True
    return False


def initializationWeights(x):
    tetta = []
    lenX = float(len(x[0]))
    for item in x[0]:
        tetta.append(random.uniform(-1.0/lenX, 1.0/lenX))
    return tetta


def futureScaling(x):
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
    i = 0
    # edit x array
    for item in x:
        j = 0
        for elem in item:
            x[i][j] = float(x[i][j]) / float(maxValue[j])
            j = j + 1
        i += 1
    return x


def meanNormalization(x):

    # find max, min (for standart deviatiob) and summ (for mean value) value in array
    summ = []
    max = []
    min = []
    for items in x:
        i = 0
        for item in items:
            if (len(summ) <= i):
                summ.append(0)
            if (len(max) <= i):
                max.append(item)
            if (len(min) <= i):
                min.append(item)
            summ[i] += item
            if max[i] < item:
                max[i] = item
            if min[i] > item:
                min[i] = item
            i += 1
    mean = []
    # create array of mean values
    for summ_i in summ:
        mean.append(summ_i/len(x))
    s = []
    k = 0
    # create array of standart deviation values
    for m in max:
        s.append(m - min[k])
        k += 1
    j = 0
    # Edit x array
    for items in x:
        i = 0
        for item in items:
            if s[i] <> 0:
                x[j][i] = float(x[j][i]-mean[i])/float(s[i])
            i += 1
        j += 1
    return x