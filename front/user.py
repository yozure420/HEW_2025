class User:
    def __init__(self, id, music, name, price):
        self.__id = id
        self.__music = music
        self.__name = name
        self.__price = price
    
    @property
    def id(self):
        return self.__id

    @property
    def name(self):
        return self.__name
    
    @property
    def music(self):
        return self.__music
    
    @property
    def price(self):
        return self.__price