#include <iostream>
int gcd(int a, int b) {          // assumes a, b > 0
    while (a != b) {
        if (a > b) a -= b;
        else       b -= a;
    }
    return a;
}
int main() { std::cout << gcd(48, 18) << "\n"; }   // 6