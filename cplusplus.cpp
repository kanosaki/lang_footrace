
#include <iostream>
#include <set>
using namespace std;

class Solver 
{
public:
    Solver ();
    int solve(int n);
    virtual ~Solver ();

private:
    set<int> _cache;
    bool is_prime(int n);
    bool is_in_memo(int n);
    bool is_prime_raw(int n);
};


Solver::Solver()
{
}

bool
Solver::is_in_memo(int n)
{
    set<int>::iterator itl = _cache.find(n);
    return itl != _cache.end();
}

bool
Solver::is_prime(int n)
{
    if (n < 2) return false;
    if (n == 2) return true;
    if (n % 2 == 0) return false;
    int i;
    for (i = 3; i * i <= n; i += 2) {
        if(n % i == 0)
            return false;
    }
    return true;
}

int
Solver::solve(int n)
{
    int start, i;
    int ret = 0;
    if (n == 2) {
        ret = 1;
        start = 3;
    } else if (n % 2 == 0) {
        start = n + 1;
    } else {
        start = n + 2;
    }

    for (i = start; i <= n * 2; i += 2) {
        if (is_prime(i)) {
            ret += 1;
        }
    }
    return ret;
}

Solver::~Solver()
{

}


int main(int argc, const char *argv[])
{
    int input, result;
    Solver solver;
    while (true) {
        cin >> input;
        if (!input) break;
        result = solver.solve(input);
        cout << result << endl;
    }
    return 0;
}
