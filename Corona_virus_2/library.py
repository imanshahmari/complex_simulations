import math
import numpy as np

class Agent:
    def __init__(self, i, posx, posy,deltax,deltay):
        #ID and name
        self.index=i
        self.name="Individual "+str(i)
        #State: Susceptible, Infected or Retired
        self.infected = False
        self.susceptible = True
        self.retired = False
        self.dead = False
        #Current position
        self.posx = posx
        self.posy=posy
        #is it fixed (in quarantine)?
        #self.quarantine = quarantine

        # displacement per iteration

        self.deltax =deltax
        self.deltay =deltay
        #time in which the person was infected
        self.infected_time=-1


    def __str__(self):
        return self.name+" at position "+str(self.posx)+", "+str(self.posy)

    def Infect(self,i):
        #infect
        self.infected=True
        self.susceptible=False
        self.retired = False
        self.infected_time=i

    def Heal(self):
        #heal
        self.retired=True
        self.susceptible=False
        self.infected=False

    def Die(self):
        self.retired=False
        self.susceptible=False
        self.infected=False
        self.dead = True

    def make_susceptible(self):
        self.retired=False
        self.susceptible=True
        self.infected=False
        self.dead = False



    def check_heal(self,gamma):
        #this function is used to heal the person if the established infection time has passed
        r = np.random.random()
        if r < gamma:
            self.Heal()


    def update_pos(self,d):
        r = np.random.random()
        if r < d:
            """
            if self.quarantine:
                self.posx = self.posx
                self.posy = self.posy
            """
            moves_list = {"left": (-1, 0), "right": (1, 0), "up": (0, 1), "down": (0, -1)}
            r_move = np.random.randint(0, 4)
            if r_move == 0:
                next_move = moves_list["left"]
            elif r_move == 1:
                next_move = moves_list["right"]
            elif r_move == 2:
                next_move = moves_list["up"]
            else:
                next_move = moves_list["down"]
            self.posx = self.posx +next_move[0]
            self.posy = self.posy +next_move[1]
        else:
            self.posx = self.posx
            self.posy = self.posy


        if self.posx>100:
            self.posx=100
        if self.posy>100:
            self.posy=100
        if self.posx<0:
            self.posx=0
        if self.posy<0:
            self.posy=0

    def get_color(self):
        if self.infected:
            return 'red'
        if self.susceptible:
            return 'blue'
        if self.retired: #or self.quarantine:
            return 'gray'
        if self.dead:
            return 'black'

    def get_pos(self):
        return (self.posx,self.posy)

    def get_dist(self,x,y):
        #this funcion calculates the distance between this person an another.
        return math.sqrt((self.posx-x)**2+(self.posy-y)**2)