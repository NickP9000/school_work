import time
import random
import math

def shortBubbleSort(alist):
    exchanges = True
    passnum = len(alist)-1
    while passnum > 0 and exchanges:
        exchanges = False
        for i in range(passnum):
           if alist[i]>alist[i+1]:
               exchanges = True
               temp = alist[i]
               alist[i] = alist[i+1]
               alist[i+1] = temp
        passnum = passnum-1

def selectionSort(alist):
   for fillslot in range(len(alist)-1,0,-1):
       positionOfMax=0
       for location in range(1,fillslot+1):
           if alist[location]>alist[positionOfMax]:
               positionOfMax = location

       temp = alist[fillslot]
       alist[fillslot] = alist[positionOfMax]
       alist[positionOfMax] = temp
       
def insertionSort(alist):
   for index in range(1,len(alist)):

     currentvalue = alist[index]
     position = index

     while position>0 and alist[position-1]>currentvalue:
         alist[position]=alist[position-1]
         position = position-1

     alist[position]=currentvalue
     
def shellSort(alist):
    sublistcount = len(alist)//2
    while sublistcount > 0:

        for startposition in range(sublistcount):
            gapInsertionSort(alist,startposition,sublistcount)

        #print("After increments of size",sublistcount,"The list is",alist)

        sublistcount = sublistcount // 2

def gapInsertionSort(alist,start,gap):
    for i in range(start+gap,len(alist),gap):

        currentvalue = alist[i]
        position = i

        while position>=gap and alist[position-gap]>currentvalue:
            alist[position]=alist[position-gap]
            position = position-gap

        alist[position]=currentvalue
        
def mergeSort(alist):
    #print("Splitting ",alist)
    if len(alist)>1:
        mid = len(alist)//2
        lefthalf = alist[:mid]
        righthalf = alist[mid:]
        
        #print("\tLeft half:",lefthalf)
        #print("\tRight half:",lefthalf)

        mergeSort(lefthalf)
        mergeSort(righthalf)

        i=0
        j=0
        k=0
        while i < len(lefthalf) and j < len(righthalf):
            if lefthalf[i] <= righthalf[j]:
                alist[k]=lefthalf[i]
                i=i+1
            else:
                alist[k]=righthalf[j]
                j=j+1
            k=k+1

        while i < len(lefthalf):
            alist[k]=lefthalf[i]
            i=i+1
            k=k+1

        while j < len(righthalf):
            alist[k]=righthalf[j]
            j=j+1
            k=k+1


N = 10000
random_list = [random.randint(1,1000000) for i in range(N)]
random_list_copy1 = random_list[:]
random_list_copy2 = random_list[:]
random_list_copy3 = random_list[:]
random_list_copy4 = random_list[:]
random_list_copy5 = random_list[:]

start = time.time()
shortBubbleSort(random_list_copy1)
end = time.time()
print("Bubble sort:",(end-start),"seconds")


start = time.time()
selectionSort(random_list_copy2)
end = time.time()
print("Selection sort:",(end-start),"seconds")

start = time.time()
insertionSort(random_list_copy3)
end = time.time()
print("Insertion sort:",(end-start),"seconds")

start = time.time()
shellSort(random_list_copy4)
end = time.time()
print("Shell sort:",(end-start),"seconds")

start = time.time()
mergeSort(random_list_copy5)
end = time.time()
print("Merge sort:",(end-start),"seconds")