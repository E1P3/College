#pragma once
#include "date.hpp"

class event: public date{
protected:
  std::string description;
public:
  event(int y, int m, int d, std::string desc);
  event();
  ~event();
  
  void print_diagnostics();

};
