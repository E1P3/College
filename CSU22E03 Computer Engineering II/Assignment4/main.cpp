#include <iostream>
#include <string>
#include "word.hpp"

using namespace std;

void show(word* w);
void garbage(word* w);
bool check(word* w, word* s);

int main() {
word* wordlist = nullptr;

while(cin.eof() == false){
    string t_word;
    cin >> t_word;
    word *new_word = new word();
    new_word->assign(t_word);
    if(check(wordlist, new_word)){
      continue;
    }
      new_word->next = wordlist;
      wordlist = new_word;
      wordlist->count++;
}

show(wordlist);

garbage(wordlist);

}

bool check(word* w, word* s){
if(w){
      if(*w == *s){
      w->count++;
      return true;
    }
    else if(w->next){
      return check(w->next, s);
    }
   }
  return false;
}

void show(word* w){
  if(w){
    if(w->next)
      show(w-> next);
      cout <<"\""<< *w <<"\" "<< w->count << endl; 
  }
  return;
}

void garbage(word* w){
  if(w){
    if(w->next){
      garbage(w->next);
    }
    delete(w);
  }
  return;
}
