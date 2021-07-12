#include <iostream>
#include "date.hpp"

using namespace std;

void sortDates(date dateset[], int dateNumber);

int main() {

	date dates[20];
	int d, m, y;
	int x = 0;

	cout << "Enter the dates in year month day format, one per line. To finish, enter the date 0 0 0." << endl; 
 
    while (x < 20) {

        cin >> y >> m >> d;

        if (y != 0 && m != 0 && d != 0) {
            dates[x] = date(y, m, d);
            x++;
        }
        else {
            break;
        }
    }

	sortDates(dates, x);


    for (int i = 0; i < x; i++) {
        dates[i].print_diagnostics();
    }
}

void sortDates(date dateset[], int dateSetSize) {

    for (int starting_point = 0; starting_point < dateSetSize; starting_point++) {

        int index_of_smallest_so_far = starting_point;

        date smallest_so_far = dateset[index_of_smallest_so_far];

        for (int i = starting_point + 1; i < dateSetSize; i++) {
            if (dateset[i].get_date_number() < smallest_so_far.get_date_number()) {
                smallest_so_far = dateset[i];
                index_of_smallest_so_far = i;
            }
        }

        dateset[index_of_smallest_so_far] = dateset[starting_point];
        dateset[starting_point] = smallest_so_far;
    }

}