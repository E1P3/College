#pragma once
#include <string>

class node : public std::string {
  public:
  node();
  int count;
  node *before;
  node *after;
};
