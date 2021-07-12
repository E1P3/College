#include <iostream>

using namespace std;

int gcd(int u, int v);

int main(int argc, const char* argv[]) {
    int num1;
    int num2;

    cout << "Please enter the two numbers whose GCD you wish to calculate:" << endl;

    cin >> num1;
    cin >> num2;

    if (num1 == 0 || num2 == 0 || num1 < 0 || num2 < 0)
        cout << "An error occurred." << endl;
    else
        cout << "The GCD of " << num1 << " and " << num2 << " is " << gcd(num1, num2) << "." << endl;

    return 0;
}

int gcd(int u, int v)
{
    // recursive implementation of the Stein's binary gcd algorithm

    // simple cases (termination)
    if (u == v) {
        return u;
    }

    // look for factors of 2
    if (~u & 1) { // u is even
        if (v & 1) { // v is odd
            return gcd(u >> 1, v);
        }
        else { // both u and v are even
            return gcd(u >> 1, v >> 1) << 1;
        }
    }
    if (~v & 1) { // u is odd, v is even
        return gcd(u, v >> 1);
    }

    // reduce larger argument
    if (u > v) {
        return gcd(u - v, v);
    }
    return gcd(v - u, u);
}