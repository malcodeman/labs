#include <iostream>
#include <string>

std::string intToString(int i)
{
    return std::to_string(i);
}

int main()
{
    std::cout << intToString(5);
    std::cin.get();
}