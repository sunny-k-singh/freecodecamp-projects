class MyException(Exception):
    def __init__(self, message):
        self.message= message

import re
import sys
def arithmetic_arranger2(expression, output="False"):
    
    '''This function takes at most 5 addition or substraction problems
       supplied in the expression as a list. Each problem must be supplied 
       as a string literal. For example, "23 + 456"
       
       length of each digit shouldn't be bigger than 4.
       expression: list of problems supplied as a list of strings
       output: if True, the result is supplied to the user
    
    '''
    
    #check if total number of problems supplied is within limit
    if len(expression)>5:
        raise MyException('Error: Too many problems.')
        sys.exit()
    
    numerator=[]
    denominator=[]
    operator=[]
    result=[]

    for i in range(len(expression)):
        
        #all edge cases handled.
        prob = re.findall('[^\+\-\s]+|\+|\-',expression[i])
        numerator.append(prob[0])
        denominator.append(prob[2])
        operator.append(prob[1])
    
    for i in range(len(expression)):
        
        #lets handle the exceptions first
        #conversion error
        try:
            int(numerator[i])
            int(denominator[i])
            
        except ValueError:
            return 'Error: Numbers must only contain digits.' 
            return 
        
        #operator error
        if operator[i] not in ('+','-'):
            raise MyException("Error: Operator must be '+' or '-'.")
            sys.exit()    
            
        if len(numerator[i])>4 or len(denominator[i])>4:
            raise MyException("Error: Numbers cannot be more than four digits.")
    
    output_string=''
    for i in range(len(expression)): #print first row

            
            
        output_string+='  ' #two spaces for operator sign in second row
        
        if len(numerator[i])<len(denominator[i]):
        
            space = len(denominator[i])-len(numerator[i])
            output_string+=' '*space
            
        
        output_string+=str(int(numerator[i]))
        if i<len(expression)-1:
            output_string+=' '*4
        
    output_string+='\n'
     
    for i in range(len(expression)): #print second row with operators
        

        
        output_string+=operator[i]+' '
        
        if len(numerator[i])>len(denominator[i]):
            space = len(numerator[i])-len(denominator[i])
            output_string+=' '*space
            
        
        output_string+=str(int(denominator[i]))
        
        if i<len(expression)-1:
            output_string+=' '*4
    
    output_string+='\n'
    
    for i in range(len(expression)): #print third row of dashes
        
        a=max(len(numerator[i]),len(denominator[i]))
        output_string+='-'*(2+a)
        if i<len(expression)-1:
            output_string+=' '*4
    
    
    
    
    if output==True:
        output_string+='\n'
        for i in range(len(expression)): #print fourth row
        
            #Exception has already been handled so we only get + or -
            if operator[i]=='+':
                result.append(int(numerator[i])+int(denominator[i]))
            else:
                result.append(int(numerator[i])-int(denominator[i]))
            
            a=max(len(numerator[i]),len(denominator[i]))+2 #max length
            space= a - len(str(result[i]))
       
            output_string+=' '*space+str(result[i])
            if i<len(expression)-1:
                output_string+=' '*4          
    
    return output_string    
    
def arithmetic_arranger(expression, option=False):
    try:
        return arithmetic_arranger2(expression, option)
    except MyException as e:
        return str(e)
    #except:
    #    return 'Something Went Wrong'  