class FeetInches:
    
    def __init__(self,f,i):
        self.feet = f
        self.inches = i
        
    def simplify(self):
        """
        if the number of inches is > 12, 
        this regroups the excess into feet
        """
        self.feet += self.inches // 12
        self.inches = self.inches % 12
    
    def __repr__(self):
        return str(self.feet)+"ft. "+str(self.inches)+"in."
    
    def __add__(self,other_measurement):
        total_feet = self.feet + other_measurement.feet
        total_inches = self.inches + other_measurement.inches
        
        #create an new FeetInches object with the new measurements
        total_FI = FeetInches(total_feet,total_inches)
        total_FI.simplify()
        return total_FI
    
    def __lt__(self,other):
        if 12*self.feet+self.inches < 12*other.feet+other.inches:
            return True
        else:
            return False
        
    def __eq__(self, other):
        if 12*self.feet+self.inches == 12*other.feet+other.inches:
            return True
        else:
            return False
        
    def __le__(self, other):
        if 12*self.feet+self.inches <= 12*other.feet+other.inches:
            return True
        else:
            return False
        
measurement1 = FeetInches(3,6)
measurement2 = FeetInches(2,6)
print(measurement1 <= measurement2)

measurement3 = FeetInches(3,6)
measurement4 = FeetInches(2,24)
print(measurement3 <= measurement4)

measurement1 = FeetInches(3,6)
measurement2 = FeetInches(2,18)
print(measurement1 == measurement2)



