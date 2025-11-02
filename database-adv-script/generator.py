def decorator():
    def wrapper():
        print("Before calling the function.")
        
        print("After calling the function.")
        
    return wrapper
@decorator
def my_function():
    print("Inside the function.")
my_function()