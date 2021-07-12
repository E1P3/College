#pragma once
#include <string>

class linked : public std::string {
  public:
  linked();
  linked(std::string word);
  int count;
  linked *next;
};
