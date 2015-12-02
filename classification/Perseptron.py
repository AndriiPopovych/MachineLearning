from Painter import *


class Perceptron:
    w = []
    X = []
    Y = []
    eta = 0.5

    def __init__(self):
        self.painter = Painter()

    def __del__(self):
        self.painter.show()

    def setData(self, _X, _Y):
        i = 0
        for row in _X:
            rowArray = [1]
            for item in row:
                rowArray.append(item)
            if _Y[i] == 1:
                self.painter.addPoint(rowArray[1], rowArray[2], 'ro')
            else:
                self.painter.addPoint(rowArray[1], rowArray[2], 'x')
            self.X.append(rowArray)
            self.Y.append(_Y[i])
            i += 1

    def initWeight(self):
        countX = len(self.X[0])
        for i in range(0, countX):
            self.w.append(1)

    def adder(self, index):
        summ = 0
        i = 0
        for x in self.X[index]:
            summ += x * self.w[i]
            i += 1
        return summ

    def activationFunction(self, z):
        if z > 0:
            return 1
        if z < 0:
            return -1

    def calculate(self):
        a = True
        i = 0
        counter = 0
        goodCounter = 0
        while a:
            z = self.adder(i)
            h = self.activationFunction(z)
            # print h
            if h != self.Y[i]:
                goodCounter = 0
                # change weight
                print("changing weight...")
                delta = self.Y[i] - z
                j = 0
                for w in self.w:
                    self.w[j] += self.eta * delta * self.X[i][j]
                    j += 1
                x1 = float(-self.w[0] - self.w[2] * 2) / float(self.w[1])
                x2 = float(-self.w[0] - self.w[1] * 2) / float(self.w[2])
                self.painter.paintLine([x1, 2], [2, x2])
            else:
                goodCounter += 1
                if float(goodCounter) / float(len(self.X)) == 1:
                    print ("success")
                    self.painter.show()
                    return
            if counter >= 1000:
                print ("iteration was ended")
                return
            i += 1
            if i == len(self.X):
                i = 0
            counter += 1
            print ("iteration #" + str(counter))
