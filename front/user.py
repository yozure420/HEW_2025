class User:
    def __init__(self, music, name, price):
        self.__music = music
        self.__name = name
        self.__price = price
    
    @property
    def name(self):
        return self.__name
    
    @property
    def music(self):
        return self.__music
    
    @property
    def price(self):
        return self.__price