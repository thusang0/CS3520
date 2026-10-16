#include <iostream>
int main() {
    int arr[] = {3, 8, 5, 12, 7, 10, 4, 9};
    int n = 8, count = 0;
    for (int i = 0; i < n; i++)
        if ((arr[i] & 1) == 0) count++;
    std::cout << count << "\n";    // 4
}