
def recursive_search(item, a_list):
    if a_list == []:
        return False
    elif a_list[0] == item:
        return True
    else:
        return recursive_search(item, a_list[1:])


