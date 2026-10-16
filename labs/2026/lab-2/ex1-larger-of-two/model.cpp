#include <iostream>
int main() {
    int a = 17, b = 25;
    int larger = (a >= b) ? a : b;
    std::cout << larger << "\n";   // 25
