
import std.stdio;
import std.conv;
import std.string;

class Solver
{
    public this(){
    }

    protected bool is_prime(int n){
        if (n < 2) {return false;}
        if (n == 2) {return true;}
        if (n % 2 == 0) {return false;}
        for (int i = 3; i * i <= n; i += 2) {
            if (n % i == 0) { return false; }
        };
        return true;
    }

    public int solve(int n){
        int start, ret = 0;
        if (n % 2 == 0){
            start = n + 1; 
        } else {
            start = n + 2;
        }

        for (int i = start; i < n * 2; i += 2){
            if (this.is_prime(i)){
                ret += 1;
            }
        }
        return ret;
    }

}

void
main(string[] args)
{
    Solver solver = new Solver();
    while(true){
        int val = to!int(chop(readln()));
        if(val == 0){
            break;
        }
        int result = solver.solve(val);
        writeln(result);
    }

}
