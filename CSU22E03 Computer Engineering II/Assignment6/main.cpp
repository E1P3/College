#include <iostream>
#include <string>
#include <fstream>
#include "node.hpp"

using namespace std;

void check_node(string new_node, node*& tree);
bool process_node(string new_node, string word_after, node*& tree);
void print_tree(node *tree);
void word_switch(int c);
void check_pairs(node*& tree);
void show_pair(linked*& pairs, string word);

int main() {
  string filename;
  ifstream file;
  int wordcount = 0;
  int individual_wordcount = 0;
  node* root = nullptr;

while(!file.is_open()){

  cout << "Please enter the name of the book file:" << endl;
  cin >> filename;
  
  file.open(filename);
  if(file.fail()){
    cout << "An error occurred attempting to open the file \""<< filename <<"\"."<< endl;
  }
}

string word;
string word_after;

file >> word;

while(file >> word_after){
  wordcount++;
  if(process_node(word, word_after ,root))
    individual_wordcount++;

word = word_after;
}

word_after = "";
wordcount++;
if(process_node(word, word_after ,root))
  individual_wordcount++;



cout <<"The file \""<< filename <<"\" contains "<< wordcount <<" words of which "<<individual_wordcount<<" are distinct."<< endl;

file.close();

cout <<"Please enter the word you wish to check:"<< endl;

cin >> word;

while(!cin.eof()){
  check_node(word, root);

  cout <<"Please enter the word you wish to check:"<< endl;

  cin >> word;
}

delete(root);

cout << "Goodbye" << endl;
}


bool process_node(string new_node, string word_after, node*& tree){

	bool response;

	if (tree == nullptr) {
		tree = new node();
    tree->process_pairs(word_after, tree->pairs);
    tree->assign(new_node);
		response = true; // it is a new node
	} else {
		if (new_node == *tree) {
			tree->count++;
      tree->process_pairs(word_after, tree->pairs);
			response = false; // it is not a new node
		} else {
			if (new_node < *tree) {
				response = process_node(new_node, word_after, tree->before);
			} else {
				response = process_node(new_node, word_after, tree->after);
			}
		}
	}
	return response;
}

void check_node(string new_node, node*& tree){
	if (tree == nullptr) {
    cout << "The word \"" << new_node <<"\" was not found." << endl; 
	} else {
		if (new_node == *tree) {
      check_pairs(tree);
		} else {
			if (new_node < *tree) {
				check_node(new_node, tree->before);
			} else {
				check_node(new_node, tree->after);
			}
		}
	}
}

void check_pairs(node*& tree){

  if(!tree->pairs){
    cout << "Word pairs starting with \""<< *tree << "\" were not found." << endl;
    return;
  }

  cout <<"Word pairs starting with \""<< *tree << "\" were found ";

  word_switch(tree->count);

  tree->sort_pairs();
  
  show_pair(tree->pairs, *tree);

}

void show_pair(linked*& pairs, string word){

  cout << "\"" << word <<" "<< *pairs <<"\" was found ";
  word_switch(pairs->count);

  if(pairs->next)
    show_pair(pairs->next, word);

}

void word_switch(int c){
  switch(c){
        case 1:
          cout << "once." <<endl;
          break;

        case 2:
          cout  <<"twice." << endl;
          break;
  
        default:
          cout << c << " times." << endl;

      }
}
