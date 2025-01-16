import matplotlib.pyplot as plt
import random
import time


#this defines which list sizes 
#we want to run experiments on
N_VALUES = range(100000,1000001,100000)
EXPERIMENT_REPETITIONS = 20  #how many repetitions of the experimentt tot perform


test_lists = []  #this will keep track of all the lists of different sizes we're using
experiment_times = []  #these are to record running times

#for each list size we want to try, generate a random list of ints of that size
for n in N_VALUES:
    print("Generating a random integer list of size",n)
    random_list = [random.randint(1,1000000) for i in range(n)]
    test_lists.append(random_list)
    

#run the experiment for each list size
experiment_run_times = []
for test_list in test_lists:
    print("Running experiment on a list of size",len(test_list))
    
    #run several repetitions of each test to average out
    #outside influences on run times
    current_experiment_run_time = 0
    for i in range(EXPERIMENT_REPETITIONS):
        
        #using a copy of the list each time so we don't accidentally
        #change the list from one run to the next
        test_list_copy = test_list[:]
        
        #here's a random index that can be used if necessary
        random_index = random.randint(0,len(test_list_copy)-1)

        start = time.time()

        ### BEGIN CODE BEING TIMED
        
        #0 in test_list_copy  #testing the built-in search operator
        #x = test_list_copy[random_index]  #testing list access
        #test_list_copy.pop(0)
        test_list_copy.sort() #sort the list
        
        ### END CODE  BEING TIMED

        end = time.time()
        
        #summing up the run times over all repetitions for this experiment
        current_experiment_run_time += (end-start)
    
    #we're done with this list size, so record its total run time
    experiment_run_times.append(current_experiment_run_time)
    

print("Here are the run times from the experiment:",experiment_run_times)

#Plotting run times compared to list size
plt.scatter(N_VALUES,experiment_run_times)
plt.xlabel("n")
plt.ylabel("running time in seconds")
plt.show()
