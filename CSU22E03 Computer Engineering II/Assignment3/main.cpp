#include <iostream>
#include "date.hpp"
#include "event.hpp"

using namespace std;

void sortDates(event eventSet[], int dateNumber);

int main() {
  const int size = 20;
	event events[size];
	int d, m, y;
  char c;
  string description;
	int x = 0;

	cout << "Enter the events in year month day:description format, one per line. To finish, enter the date 0 0 0." << endl; 
 
    while (x < size) {

        cin>>y>>m>>d;

        if (y != 0 && m != 0 && d != 0) { 
            cin >> c;
            getline(cin, description);
            events[x] = event(y, m, d, description);
            x++;
        }
        else {
            break;
        }
    }

	sortDates(events, x);


    for (int i = 0; i < x; i++) {
        events[i].print_diagnostics();
    }
}

void sortDates(event eventSet[], int eventSetSize) {

    for (int starting_point = 0; starting_point < eventSetSize; starting_point++) {

        int index_of_smallest_so_far = starting_point;

        event smallest_so_far = eventSet[index_of_smallest_so_far];

        for (int i = starting_point + 1; i < eventSetSize; i++) {
            if (eventSet[i].get_date_number() < smallest_so_far.get_date_number()) {
                smallest_so_far = eventSet[i];
                index_of_smallest_so_far = i;
            }
        }

        eventSet[index_of_smallest_so_far] = eventSet[starting_point];
        eventSet[starting_point] = smallest_so_far;
    }

}
