#pragma once
#include <string>

class word : public std::string {
  public:
  word *next; // use this to link to the next  object in the linked list
  int count;
};
