from library import *
import matplotlib.pyplot as plt

number_of_individuals = 1000
p_infected = 1
list_individuals =[]

for i in range(number_of_individuals):
    p = Agent(i,np.random.randint(0,100), np.random.randint(0,100),0,0)
    if np.random.random()< p_infected/100:
        p.Infect(0)
    list_individuals.append(p)



endtime = 100




betas = np.linspace(0,1,10)
d = 0.8
gamma = 0.02
r_transmission = 1
rt =[]
"""
for beta in betas:
    for t in range(0,endtime):
        for agent1 in list_individuals:
            if agent1.infected:
                for agent2 in list_individuals:
                    distance = agent1.get_dist(agent2.posx,agent2.posy)
                    if distance <= r_transmission:
                        r = np.random.random()
                        if r < beta:
                            if agent2.susceptible:
                                agent2.Infect(0)
                agent1.check_heal(gamma)
            agent1.update_pos(d)
    recovered_people = np.sum([p.retired for p in list_individuals])
    rt.append(recovered_people)
"""

rt_gamma1 =[6, 20, 168, 350, 531, 720, 855, 935, 975, 985]
rt_gamma2 = [5, 11, 60, 156, 322, 502, 617, 762, 845, 888]

plt.figure(figsize=(18,9))
plt.scatter(betas,rt_gamma1,c="blue",s=50,label="gamma 0.01")
plt.scatter(betas,rt_gamma2,c="green",s=50,label="gamma 0.02")
plt.xlabel("Beta")
plt.ylabel("R infinity")
