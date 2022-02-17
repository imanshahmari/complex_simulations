from library import Agent
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation

#SIMULATION PARAMETERS
number_of_individuals=1000 #number of individuals
p_infected = 1  #percentage of infected people at the beginning of the simulation (0-100%)
#p_quaratined_procent = 10  #percentage of the people in quarantine (0-100%)


infected_number=0
list_individuals=[]

#creating all the individuals in random positions. Infecting some of them
for i in range(number_of_individuals):
    p = Agent(i,np.random.randint(0,100), np.random.randint(0,100),0,0)

    if np.random.random()<p_infected/100:
        p.Infect(0)
        infected_number= infected_number + 1
    #if np.random.random()<p_quaratined_procent/100:
    #    p.quarantine=True

    list_individuals.append(p)

#this creates all the graphics
fig = plt.figure(figsize=(18,9))
ax = fig.add_subplot(1,2,1)
cx = fig.add_subplot(1,2,2)
ax.axis('off')
cx.axis([0,1000,0,number_of_individuals])
scatt=ax.scatter([p.posx for p in list_individuals],
           [p.posy for p in list_individuals],c='blue',s=8)
caja = plt.Rectangle((0,0),100,100,fill=False)
ax.add_patch(caja)
cvst,=cx.plot(infected_number, color="red", label="Currently infected")
rvst,=cx.plot(infected_number, color="green", label="Recovered")
svst,=cx.plot(infected_number,color ="blue",label="Susceptible")
dvst,=cx.plot(infected_number,color ="black",label="Dead")
cx.legend(handles=[rvst,cvst,svst,dvst])
cx.set_xlabel("Time")
cx.set_ylabel("People")



infected_people = np.sum([p.infected for p in list_individuals])
recovered_people = 0
susceptible_people = np.sum([p.susceptible for p in list_individuals])

ct=[infected_people]
rt=[0]
st=[susceptible_people]
dt =[0]
t=[0]



#function excecuted frame by frame
def update(frame,rt,ct,st,t):
    alpha = 0.01 #prob of being susceptible again
    d = 1  #prob of moving randomly
    gamma = .01 #prob of recovering
    beta = 0.1  #prob of infecting
    mu = 0  #prob of dying
    r_transmission = 1
    colores = []
    sizes = [8 for p in list_individuals]
    for agent1 in list_individuals:
        if agent1.infected:
            for agent2 in list_individuals:
                distance = agent1.get_dist(agent2.posx,agent2.posy)
                if distance <= r_transmission:
                    r = np.random.random()
                    if r < beta:
                        if agent2.susceptible:
                            agent2.Infect(0)
            r = np.random.random()
            if r < mu:
                agent1.Die()
            agent1.check_heal(gamma)
        if agent1.retired:
            r = np.random.random()
            if r < alpha:
                agent1.make_susceptible()
        if agent1.infected or agent1.retired or agent1.susceptible:
            agent1.update_pos(d)


        colores.append(agent1.get_color()) #change dot color according to the person's status

    #update the plotting data

    infected_people = np.sum([p.infected for p in list_individuals])
    recovered_people = np.sum([p.retired for p in list_individuals])
    susceptible_people = np.sum([p.susceptible for p in list_individuals])
    dead_people = np.sum([p.dead for p in list_individuals])

    ct.append(infected_people)
    rt.append(recovered_people)
    st.append(susceptible_people)
    dt.append(dead_people)

    t.append(frame)


    #tramsfer de data to the matplotlib graphics
    offsets=np.array([[p.posx for p in list_individuals],
                     [p.posy for p in list_individuals]])
    scatt.set_offsets(np.ndarray.transpose(offsets))
    scatt.set_color(colores)
    scatt.set_sizes(sizes)
    cvst.set_data(t,ct)
    rvst.set_data(t,rt)
    svst.set_data(t,st)
    dvst.set_data(t,dt)
    return scatt,cvst,rvst,svst,dvst

#run the animation indefinitely
animation = FuncAnimation(fig, update, interval=25,fargs=(rt,ct,st,t),blit=True)

plt.show()