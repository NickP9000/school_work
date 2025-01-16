#Nick Peters, worked alone
def search_for(item, list_of_items):
    for item_num in range(len(list_of_items)):
        if (list_of_items[item_num] == item):
            return True
    return False