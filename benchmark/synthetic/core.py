"""
The synthetic dataset is generated following the setup in 'Federated Optimization in Heterogeneous Networks'.
(The link for this paper is https://arxiv.org/abs/1812.06127).
The details of this dataset is described as below:

    for each user u_k:
        The data satisfies 'y_ki = argmax(softmax(W_k x_ki + b_k))'
        'x_ki:60×1, y_ki:1×1, W_k:10×60, b_k:10×1' 
        where for the locally optimal model (i.e. P(Y_k|X_k)): 
            W_k~N(u_k, 1), b_k~N(u_k, 1), u_k~N(0, alpha)
        and for the local data D_k={(x_ki, y_ki)} (i.e. P(X_k)): 
            X_k~N(v_k, Sigma), v_k[j]~N(B_k, 1) for all j in range(60), B_k~N(0, beta), Sigma=Diag([i^(-1.2) for i in range(60)])

    Thus, alpha controls how differently the features are distributed (i.e. P(X)), 
    and beta controls how differently the locally optimal models are distributed (i.e. P(Y|X)).
    By the way, alpha=0 and beta=0 don't means an I.I.D. distribution
    since the local distribution of the data and the models can still
    be different (e.g. the different centers for their local Gaussian distributions).
    The I.I.D. samples are generated by using the same global model
    (i.e. keeps P(Y|X) and P(X) always the same for all the clients 
    by setting (W_k,b_k)=(W_global, b_global) and v_k=v_global = [0,...,0] for all k).
    
"""
from benchmark.toolkits import BasicTaskGen, XYTaskReader, ClassifyCalculator
from scipy.special import softmax
import numpy as np
import os.path
import ujson
class TaskGen(BasicTaskGen):
    def __init__(self, num_classes=10, dimension=60, dist_id = 0, num_clients = 30, skewness = 0.5, minvol=10, rawdata_path ='./benchmark/synthetic/data'):
        super(TaskGen, self).__init__(benchmark='synthetic',
                                      dist_id=dist_id,
                                      skewness=skewness,
                                      rawdata_path=rawdata_path)
        self.dimension = dimension
        self.num_classes = num_classes
        self.num_clients = num_clients
        self.minvol = minvol
        self.skewness = (skewness, skewness)
        self.taskname = self.get_taskname()
        self.taskpath = os.path.join(self.rootpath, self.taskname)


    def run(self):
        if not self._check_task_exist():
            self.create_task_directories()
        else:
            print("Task Already Exists.")
            return

        xs, ys = self.gen_data(self.num_clients)
        x_trains = [di[:int(0.75 * len(di))] for di in xs]
        y_trains = [di[:int(0.75 * len(di))] for di in ys]
        x_valids = [di[int(0.75 * len(di)):int(0.90 * len(di))] for di in xs]
        y_valids = [di[int(0.75 * len(di)):int(0.90 * len(di))] for di in ys]
        x_tests = [di[int(0.90 * len(di)):] for di in xs]
        y_tests = [di[int(0.90 * len(di)):] for di in ys]
        self.cnames = self.get_client_names()
        X_test = []
        Y_test = []
        for i in range(len(y_tests)):
            X_test.extend(x_tests[i])
            Y_test.extend(y_tests[i])
        self.test_data = {'x': X_test, 'y': Y_test}
        feddata = {
            'store': 'XY',
            'client_names': self.cnames,
            'dtest': self.test_data
        }
        for cid in range(self.num_clients):
            feddata[self.cnames[cid]] = {
                'dtrain': {
                    'x': x_trains[cid],
                    'y': y_trains[cid]
                },
                'dvalid': {
                    'x': x_valids[cid],
                    'y': y_valids[cid]
                }
            }

        with open(os.path.join(self.taskpath, 'data.json'), 'w') as outf:
            ujson.dump(feddata, outf)

    def softmax(self, x):
        ex = np.exp(x)
        sum_ex = np.sum(np.exp(x))
        return ex / sum_ex

    def gen_data(self, num_clients):


        self.dimension = 60
        # global for I.I.D.
        W_global = np.random.normal(0, 1, (self.dimension, self.num_classes))
        b_global = np.random.normal(0, 1, self.num_classes)
        v_global = np.zeros(self.dimension)

        # parameters for local models
        # create U=[u_1, ...u_k] that control the difference of locally optimal models
        Us = np.random.normal(0, self.skewness[0], num_clients)
        if self.dist_id in [0,6]:
            W = [W_global for _ in range(num_clients)]
            b = [b_global for _ in range(num_clients)]
        else:
            W = [np.random.normal(Us[k], 1, (self.dimension, self.num_classes)) for k in range(num_clients)]
            b = [np.random.normal(Us[k], 1, self.num_classes) for k in range(num_clients)]

        # parameters for local data features
        # create Sigma = Diag([i^(-1.2) for i in range(60)])
        diagonal = np.zeros(self.dimension)
        for j in range(self.dimension):
            diagonal[j] = np.power((j + 1), -1.2)
        Sigma = np.diag(diagonal)
        # create V=[v_1, ...v_k] and B=[B_1, ...B_k]
        B = np.random.normal(0, self.skewness[1], num_clients)
        V = np.zeros((num_clients, self.dimension))
        if self.dist_id in [0,6]:
            for k in range(num_clients):
                V[k]=v_global
        else:
            for k in range(num_clients):
                V[k] = np.random.normal(B[k], 1, self.dimension)

        # set data is balance or not
        if self.dist_id == 6 or self.dist_id == 7:
            samples_per_user = np.random.lognormal(4, 2, (num_clients)).astype(int) + self.minvol
        else:
            samples_per_user = [40 * self.minvol for _ in range(self.num_clients)]

        X_split = [[] for _ in range(num_clients)]
        y_split = [[] for _ in range(num_clients)]
        for k in range(num_clients):
            # X_ki~N(v_k, Sigma)
            X_k = np.random.multivariate_normal(V[k], Sigma, samples_per_user[k])
            Y_k = np.zeros(samples_per_user[k], dtype=int)
            for i in range(samples_per_user[k]):
                # Y_ki = argmax(softmax(W_k x_ki + b_k))
                tmp = np.dot(X_k[i], W[k]) + b[k]
                Y_k[i] = np.argmax(softmax(tmp))
            X_split[k] = X_k.tolist()
            y_split[k] = Y_k.tolist()
        return X_split, y_split

class TaskReader(XYTaskReader):
    def __init__(self, taskpath=''):
        super(TaskReader, self).__init__(taskpath)

class TaskCalculator(ClassifyCalculator):
    def __init__(self, device):
        super(TaskCalculator, self).__init__(device)
