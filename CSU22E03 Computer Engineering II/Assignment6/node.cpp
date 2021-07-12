#include "node.hpp"
#include  <iostream>

using namespace std;

node::node() {
	count = 1;
  pairs= nullptr;
  before = nullptr;
  after = nullptr;
}

void node::process_pairs(std::string word, linked*& link){

  if(link == nullptr){
    if(word != ""){
      link = new linked(word);
    }
    else{
      count--;
      return;
    }
  }
  else{
    if(*link != word){
      process_pairs(word, link->next);
    }
    else{
      link->count++;
    }
  }
}

void node::sort_pairs()
{ 
    linked *sorted = nullptr; 
  
    linked *current = pairs; 
    while (current != nullptr) 
    { 
        linked *next = current->next; 
  
        node::sortedInsert(sorted, current); 
  
        current = next; 
    } 
  
    pairs = sorted; 
} 

void node::sortedInsert(linked*& link, linked*& new_node) 
{ 
    linked *current; 

    if (link == nullptr || *link > *new_node) 
    { 
        new_node->next = link; 
        link = new_node; 
    } 
    else
    { 

        current = link; 
        while (current->next!=nullptr && current->next->compare(*new_node) < 1) 
        { 
            current = current->next; 
        } 
        new_node->next = current->next; 
        current->next = new_node; 
    } 
} 

