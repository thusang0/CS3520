#include <iostream>
int factorial(int n) {
    int result = 1;
    while (n > 0) { result *= n; n--; }
    return result;
}
int main() { std::cout << factorial(5) << "\n"; }   // 120