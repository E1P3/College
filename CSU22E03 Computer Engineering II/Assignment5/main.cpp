#include <iostream>
#include <string>
#include <fstream>
#include "node.hpp"

using namespace std;

void check_node(string new_node, node*& tree);
bool process_node(string new_node, node*& tree);
void print_tree(node *tree);

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

while(file >> word){
  wordcount++;
  if(process_node(word, root))
    individual_wordcount++;
}

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


bool process_node(string new_node, node*& tree){
	bool response;
	if (tree == nullptr) {
		tree = new node();
    tree->assign(new_node);
		response = true; // it is a new node
	} else {
		if (new_node == *tree) {
			tree->count++;
			response = false; // it is not a new node
		} else {
			if (new_node < *tree) {
				response = process_node(new_node, tree->before);
			} else {
				response = process_node(new_node, tree->after);
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

		cout << "The word \"" << new_node <<"\" was found ";

      switch(tree->count){
        case 1:
          cout << "once." <<endl;
          break;

        case 2:
          cout  <<"twice." << endl;
          break;
        
        case 3:
          cout << "thrice." << endl;
          break;

        default:
          cout << tree->count << " times." << endl;

      }
		} else {
			if (new_node < *tree) {
				check_node(new_node, tree->before);
			} else {
				check_node(new_node, tree->after);
			}
		}
	}
}
