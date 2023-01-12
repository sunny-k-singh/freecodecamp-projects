#Now the bullshit that freecodecamp accepts:
import random
import copy
class Hat:
    def __init__(self, **kwargs):
        self.contents=[]
        self.kwargs=kwargs
        for key in kwargs:

            for j in range(kwargs[key]):
                self.contents.append(key)
    
    def draw(self,number): #number--> number of balls to be drawn
        
        drawn_balls=[]
        n=len(self.contents) #number of balls of current contents
        if n>number:
            
            random_balls=random.sample(range(0,n),number) #list of indices to be removed
            
            for index in random_balls:
                drawn_balls.append(self.contents[index])
                
            new_contents=[]    
            for index in range(len(self.contents)):
                
                if index not in random_balls:
                    new_contents.append(self.contents[index])
            
            self.contents=new_contents
            
            return drawn_balls
        
        else:  #if number of current balls in the bag is less than drawn number of balls
            
            drawn_balls=copy.deepcopy(self.contents)
            self.contents=[]
            
                
            return drawn_balls
        

    
def experiment(hat,expected_balls,num_balls_drawn,num_experiments):
    
    count=0
    new_hat=copy.deepcopy(hat)
    for i in range(num_experiments):
        #print('testing')
        
        #print(new_hat.contents)
        new_hat=copy.deepcopy(hat)
            
        balls=new_hat.draw(num_balls_drawn)
        #print(balls)
        flag=True
        for key in expected_balls:
            ball_count=balls.count(key)
            if ball_count<expected_balls[key]:
                flag=False
                break
        if flag==True:
            count+=1
        #print(new_hat.contents)    
    return count/num_experiments       
