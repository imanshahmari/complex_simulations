# input data
# This one is for t = 100tau
import numpy as np
import matplotlib.pyplot as plt

#input data
R = 1* 10**-6
eta = 0.001
gamma = 6* np.pi * R * eta
T = 300
kb = 1.380649 * 10 ** -23
kx = 1 * 10**-6
ky = 0.25* 10**-6

timestep_x = (gamma/kx)/ 1000
timestep_y = (gamma/ky)/ 1000

x_traj = []
y_traj = []



x = 0
y = 0
for i in range(0,10**6):
    wi_x = np.random.normal(0, 1)
    wi_y = np.random.normal(0, 1)
    x_traj.append(x)
    y_traj.append(y)
    x = x - (kx/gamma) * x *timestep_x + np.sqrt((2*kb*T*timestep_x)/gamma) * wi_x * 10**9 # converting to nm
    y = y - (ky/gamma) * y *timestep_y + np.sqrt((2*kb*T*timestep_y)/gamma) * wi_y * 10**9 # converting to nm

plt.figure(1)
plt.scatter(x_traj,y_traj,s=0.01)
plt.figure(2)
plt.hist(x_traj)
plt.figure(3)
plt.hist(y_traj)
