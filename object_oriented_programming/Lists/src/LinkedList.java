//package linkedlist;
// This class is a linked list that contains strings as data.

public class LinkedList<T>
{
	// An "inner" class for a node.
    private class Node
    {
        T value;   
        Node next;      
        
        // Constructor for a node.
        Node(T val, Node n)
        {
            value = val;
            next = n;
        } 
        
    }	
	 
    private Node head;  // list head
    
    // Linked List constructor. An empty list means the head is null.
    public LinkedList()
    {
        head = null;     
    }
    
    // Checks if the Linked List is empty.
    public boolean isEmpty()
    {        
        return (head == null);       
    }
    
    // This method returns the number of nodes in the Linked List.
    public int size()
    {
       int count = 0;
       Node p = head;     
       while (p != null)
       {
           // There is an element at p
           count ++;
           p = p.next;
       }
       return count;
    }
    
    // This method adds a new string to the beginning of the list.
    public void prepend(T e)
    {
      Node newNode = new Node(e, head);
      head = newNode;
    }
    
    //Returns a String representation of the Linked List.
    @Override
    public String toString()
    {
    	String strBuilder = "";
    	Node curr = head;
    	while(curr != null)
    	{
    		strBuilder = strBuilder + curr.value.toString() + " ";
    		curr = curr.next;
    	}
    	return strBuilder;
    }
    
    // Searches for the thingToLookFor in the Linked List. If the
    // thingToLookFor is found, the method returns true. Otherwise,
    // the method returns false.
    public boolean search(T thingToLookFor)
    {
    	Node curr = head;
    	
    	while(curr != null)
    	{
    		if(thingToLookFor.equals(curr.value))
    		{
    			return true;
    		}
    		curr = curr.next;
    	}
    	
    	return false;
    }
    
    // Returns the String at position i of the Linked List. If there is
    // no position i, then the method throws a new IndexOutOfBoundsException.
    public T get(int i)
    {
    	if(i < 0)
    		throw new IndexOutOfBoundsException();
    	
    	Node curr = head;
    	int listPosition = 0;
    	
    	while(curr != null)
    	{
    		if(listPosition == i)
    		{
    			return curr.value;
    		}
    		
    		curr = curr.next;
    		listPosition++;
    	}
    	
    	throw new IndexOutOfBoundsException();
    }
    
    // Removes the String deleting from the linked list. Returns true if
    // deleting was successfully removed. If deleting does not exist in
    // the Linked List, it returns false.
    public boolean remove(T deleting)
    {
    	Node curr = head;
    	Node prev = null;
    	
    	if (isEmpty()) 
    		return false;      
      
    	if (deleting.equals(head.value))
    	{
    		// Removal of first item in the list
    		head = head.next;    
    		return true;
    	}
      
    	while(curr != null)
    	{
    		if(deleting.equals(curr.value))
    		{
    			prev.next = curr.next;
    			return true;
    		}
    		prev = curr;
        	curr = curr.next;
    	}
    	
    	return false;
    }
    
}