#include <iostream>
#include <string>
#include "date.hpp"
#include "event.hpp"


using namespace std;

event::event(int y, int m, int d, std::string desc){
  this -> setDate(d,m,y);
  description = desc;
}
event::event(){

}
event::~event(){

}
  
void event::print_diagnostics(){
  cout << year << " " << month << " " << day << " " << description << endl;
};
