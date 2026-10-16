#include <iostream>
int main() {
    int n = 10, sum = 0;
    for (int i = 1; i <= n; i++) sum += i;
    std::cout << sum << "\n";      // 55
}