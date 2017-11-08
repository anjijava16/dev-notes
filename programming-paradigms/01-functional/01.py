

# Input an array of 3 elements and then increment each element by 1, then return to user.
# if user input array of 3 numbers as [4,8,10] return as [5,9,11]


def increment(x):
    return x+1

def increment_elements(elements):
    results = []
    for elem in elements:
        results.append(increment(elem))
    return results

# increment_elements([35, 65, 24])
