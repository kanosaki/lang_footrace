import java.util.*;


public class Java {
    static Set<Integer> _primes = new HashSet<Integer>();

    public int solve(int n){
        int start = n + 2;
        int ret = 0;
        if(n % 2 == 0)
            start = n + 1;

        for (int i = start; i <= n * 2; i += 2) {
            if (isPrime(i)) ret += 1;
        }
        return ret;
    }

    public boolean isPrime(int n){
        if(_primes.contains(n)){
            return true;
        }else{
            boolean result = isPrimeRaw(n);
            if(result)
                _primes.add(n);
            return result;
        }
    }

    protected boolean isPrimeRaw(int n){
        if (n < 2) return false;
        if (n == 2) return true;
        if (n % 2 == 0) return false;
        for (int i = 3; i * i <= n; i += 2) {
            if (n % i == 0) return false;
        }
        return true; 
    }

    public static void main(String[] args){
        Java solver = new Java();
        Scanner scanner = new Scanner(System.in);
        while(true){
            int val = scanner.nextInt();
            if (val == 0) break;
            System.out.println(solver.solve(val));
        }
    
    }
}
