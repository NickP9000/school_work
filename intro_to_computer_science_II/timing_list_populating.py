import matplotlib.pyplot as plt
import random
import time


#These are the list sizes we'll try creating
N_VALUES = range(500,10001,500)


append_run_times = []
insert_run_times = []
for n in N_VALUES:
    
    print("Timing how long it takes to create a list of size:",n,"using append()")
    
    test_list = []
    
    start = time.time()
    
    ### BEGIN CODE BEING TIMED
    
    for i in range(n):
        random_num = random.random()  #generate a random number to put in the list
        test_list.append(random_num)
    
    ### END CODE  BEING TIMED
    
    end = time.time()
    
    append_run_times.append(end-start)
    
    print("Timing how long it takes to create a list of size:",n,"using insert()")
    
    test_list = []
    
    start = time.time()
    
    ### BEGIN CODE BEING TIMED
    
    for i in range(n):
        random_num = random.random()  #generate a random number to put in the list
        test_list.insert(0,random_num)
    
    ### END CODE  BEING TIMED
    
    end = time.time()
    
    insert_run_times.append(end-start)

print("Append run times:",append_run_times)
print("Insert run times:",insert_run_times)

plt.scatter(N_VALUES,append_run_times,label="append")
plt.scatter(N_VALUES,insert_run_times,label="insert")
plt.xlabel("n")
plt.ylabel("running time in seconds")
plt.legend(loc='upper left')
plt.show()