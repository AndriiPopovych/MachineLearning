from Neuron import Neuron


class ANN:
    neurons = []
    tetta = []
    layers = []
    startValueTetta = 0.1
    x = []

    def __init__(self):
        self.tetta = []
        self.layers.append([])

    def addNeuron(self, layer, neuron):
        if len(self.layers) <= layer:
            self.layers.append([])
        self.layers[layer].append(neuron)
        print ("adding neron..")

    def showAllNeurons(self):
        print self.layers

    def initWeight(self):
        i = 0
        for layer in self.layers:
            self.tetta.append([])
            # for zero layer we are not initialize weight
            if i != 0:
                # len(layer) + 1 because we must add bias
                for j in range(0, len(layer) + 1):
                    self.tetta[i].append(self.startValueTetta)
            i += 1

    def initInputLayer(self, xArr):
        self.tetta[0].append(self.startValueTetta)
        # init X0 (always = 1), for bias
        self.x.append([1])
        for x in xArr:
            self.tetta[0].append(self.startValueTetta)
            self.x[0].append(x)

    def forwardPropogation(self):
        for layer in range(1, len(self.layers)):
            xArray = self.x[layer-1]
            if len(self.x) <= layer:
                self.x.append([1])
            for neuron in self.layers[layer]:
                print str(xArray) + str(layer)
                self.x[layer].append(neuron.lculate(xArray, self.tetta[layer-1]))
        print self.x