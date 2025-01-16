class Movie:
    """
    """
    def __init__(self, g, n, y):
        self.genre = g
        self.name = n
        self.year = y
    
    def recommendation(self):
        if (self.genre == "comedy"):
            return "Stepbrothers"
        elif (self.genre == "horror"):
            return "It"
        elif (self.genre == "action"):
            return "The Avengers"
        elif (self.genre == "animated"):
            return "Lion King"
    
    def moviereturn(self):
        return (self.name, self.year, self.genre)
        
        
        