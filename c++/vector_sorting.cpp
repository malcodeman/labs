#include <iostream>
#include <vector>
#include <algorithm>
#include <functional>

enum order
{
    asc,
    desc
};

std::vector<int> sort(std::vector<int> &v, order o)
{
    if (o == asc)
    {
        sort(v.begin(), v.end());
        return v;
    }
    sort(v.begin(), v.end(), std::greater<int>());
    return v;
}

int main()
{
    std::vector<int> temp{4, 5, 18, 8};
    sort(temp, desc);
    for (auto i : temp)
    {
        std::cout << i << std::endl;
    }
    std::cin.get();
}