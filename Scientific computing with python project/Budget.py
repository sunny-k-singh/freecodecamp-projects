import math
class Category:
    ''' Objects of different expenditure categories belong to this class '''
    
    def __init__(self, category):
        
        self.category=category
        self.ledger=[]
        self.balance=0
    
    def deposit(self, amount, description=None):
        
        if description is None:
            description=''
        
        self.ledger.append({"amount" : amount, "description" : description})
        self.balance+=amount

    
    def withdraw(self, amount, description=None):
        
        if description is None:
            description=''
            
        if self.check_funds(amount):
            self.ledger.append({"amount" : -amount, "description" : description})
            self.balance-=amount
            return True
        
        else:
            return False
    
    def get_balance(self):
        
        return self.balance
    
    def transfer(self, amount, other):
        
        
        if self.check_funds(amount):
            self.withdraw(amount, f"Transfer to {other.category}")
            other.deposit(amount, f"Transfer from {self.category}")
            return True
        else:
            return False
    
    def check_funds(self, amount):
        
        if self.balance>=amount:
            return True
        else:
            return False
        
    def __str__(self):
        
        string=''
        space=30-len(self.category)
        string+="*"*(space//2)+self.category+"*"*(space//2)
        if len(self.category)%2==0:
            string+='\n'
        else:
            string+='*\n'
        
        for i in range(len(self.ledger)):
            
            string+=(self.ledger[i]['description']+" "*30)[:23]
            if isinstance(self.ledger[i]['amount'],int):
                
                spaces=4-len(str(self.ledger[i]['amount']))
                string+=' '*spaces+str(self.ledger[i]['amount'])+'.00'
            
            else:
                
                spaces=7-len(str(self.ledger[i]['amount']))
                string+=' '*spaces+str(self.ledger[i]['amount'])
            
            string+='\n'
        
        string+='Total: '+str(self.balance)
        return string
        
        
        
        
            

def create_spend_chart(categories):
    
    #lets calculate total withdrawl across categories and also each withdrawl
    wd=[]
    total=0
    for i in range(len(categories)):
        spending=0
        for item in categories[i].ledger:
            if item['amount']<0 and ('Transfer' not in item['description']):
                spending+=abs(item['amount'])
        wd.append(spending)
        total+=spending
    
    #now find percentage in each case to nearest 10 
    for i in range(len(categories)):
        wd[i]=(wd[i]/total)*100 
        wd[i]=math.floor(wd[i]/10)*10
        #wd[i]=(wd[i]-(wd[i]%10)) if wd[i]%10<5.0 else (wd[i]+(10-wd[i]%10))
    #READ THIS:::  Here, i only get correct result it i use floor function but that is not what rounding to 10 means right?? Rounding should be done in the way that i have commented out the code. 
      #Weird why freeCodeCamp uses this convention for rounding. 
    
    #Now comes the plotting part
    string='Percentage spent by category\n'
    for i in range(100,-10,-10):
        if i==0:
            string+= '  '+str(i)+'|'
        elif i<100:
            string+=' '+str(i)+'|'
        else:
            string+=str(i)+'|'
        for j in range(len(categories)):
            string+=" "+("o" if wd[j]>=i else " ")+" "
        string+=' \n'
    
    string+=' '*4+'-'*3*len(categories)+'-\n'
    #return string
    
    name=[item.category for item in categories]
    #print(name[0][2])
    for i in range(len(max(name, key=len))):
        string+=' '*4
        for j in range(len(categories)):
            string+=' '+(name[j][i] if i<len(name[j]) else ' ')+' '
        if i!=(len(max(name, key=len))-1):
          string+=' \n'
        else:
          string+=' '
    return string   
