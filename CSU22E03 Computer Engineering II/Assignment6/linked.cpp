#include "linked.hpp"

linked::linked(){
  count = 0;
  next = nullptr;
}

linked::linked(std::string word){
  this->assign(word);
  count = 1;
  next = nullptr;
}
