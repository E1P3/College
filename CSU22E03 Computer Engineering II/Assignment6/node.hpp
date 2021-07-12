#pragma once
#include <string>
#include "linked.hpp"

class node : public std::string {
  public:
  
  node();
  
  int count;
  
  linked *pairs;
  node *before;
  node *after;

  void process_pairs(std::string word, linked*& link);
  void sort_pairs();

  private:
  
  void compare_and_insert(linked*& link, linked*& placeholder);
  void sortedInsert(linked*& link, linked*& new_node);
};
