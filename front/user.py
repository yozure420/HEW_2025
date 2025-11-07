class User:
    def __init__(self, id, music, name, price, comment):
        self.__id = id
        self.__music = music
        self.__name = name
        self.__price = price
        self.__comment = comment
    
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
    
    @property
    def comment(self):
        return self.__comment