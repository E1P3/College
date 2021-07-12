#include <iostream>
#include "date.hpp"

using namespace std;

bool is_a_leap_year(int y);

date::date(int y, int m, int d) {
    setDate(y,m,d);
}

date::date() {

}

date::~date() {

}

int date::get_date_number() {
    // days due to completed years 
    int accumulated_days = (year - 2000) * 365;
    // days due to completed!! leap years
    for (int ty = 2000; ty < year; ty++) {
        if (is_a_leap_year(ty)) {
            accumulated_days++;
        }
    }

    // capture the real world data in a "natural" way
    int month_length[] = { 31,28,31,30,31,30,31,31,30,31,30,31 };
    for (int mt = 0; mt < month - 1; mt++) {
        accumulated_days += month_length[mt];
    }

    // deal with the possibility that the date is in a leap year
    // and we are on or after february

    if ((is_a_leap_year(year)) && (month > 2)) {
        accumulated_days++;
    }

    accumulated_days += day - 1;

    // if we can be sure that the date is legitimate, then we are done

    return accumulated_days; // placeholder
}

int date::get_day_of_week() {
    return 0; // placeholder
}

void date::setDate(int d, int m, int y){
  day = d;
  month = m;
  year = y;

}

// diagnostics stuff only
void date::print_diagnostics() {
    cout <<  year << " " << month << " " << day <<endl;
}

bool is_a_leap_year(int y) {
    bool r = false;
    if ((y % 4) == 0) {
        r = true;
    }
    if ((y % 100) == 0) {
        r = false;
    }
    if ((y % 400) == 0) {
        r = true;
    }
    return r;  
}
