class Rectangle:
    
    def __init__(self, width, height):
        self.width=width
        self.height=height
        self.perimeter=None
        self.diagonal=None
        self.area=None
        
    def set_height(self, height):
        self.height=height
    
    def set_width(self, width):
        self.width=width
     
    def get_area(self):
        self.area=self.height*self.width
        return self.area
        
    def get_perimeter(self):
        self.perimeter= (2 * self.width + 2 * self.height)
        return self.perimeter
    
    def get_diagonal(self):
        self.diagonal = ((self.width ** 2 + self.height ** 2) ** .5)
        return self.diagonal
    
    def get_picture(self):
        
        string=''
        if self.height>50 or self.width>50:
            return "Too big for picture."
        else:
            
            for i in range(self.height):
                for j in range(self.width):
                    string+='*'
                string+='\n'    
        return string
    
    def get_amount_inside(self,other):
        
        horizontal_multiplier=self.width//other.width
        verticle_multiplier=self.height//other.height
        
        return horizontal_multiplier*verticle_multiplier
    
    def __str__(self):
        
        return f"Rectangle(width={self.width}, height={self.height})"
    
class Square(Rectangle):
    
    def __init__(self, side):
        
        super().__init__(side,side)
    
    def set_side(self, side):
        
        super().set_height(side)
        super().set_width(side)

    def set_width(self,side):

        self.width=side
        self.height=side

    def set_height(self,side):
        self.height=side
        self.width=side
    def __str__(self):
        
        return f"Square(side={self.height})"
    
    
