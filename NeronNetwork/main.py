from NeronNetwork.Neuron import Neuron
from NeronNetwork.ANN import ANN


def callFunc(n):
    return n


obj = Neuron()
obj.setActivationFunction(callFunc)

ann = ANN()
ann.addNeuron(1, obj)
ann.addNeuron(1, obj)
ann.addNeuron(2, obj)
ann.addNeuron(2, obj)
ann.addNeuron(3, obj)
ann.initWeight()
ann.initInputLayer([2,4,3,2,4,2])
ann.forwardPropogation()

# ann.showAllNeurons()
# ann.forwardPropogation()
# sdafdsafasdfasdfdasf adsf asdf sadf sdaf