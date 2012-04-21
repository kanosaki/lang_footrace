<?php
class Solver
{
    private $primes = null;
    function __construct(){
        $this->primes = array();
    }

    function is_prime_raw(&$n)
    {
        if ($n < 2) return false;
        if ($n == 2) return true;
        if ($n % 2 == 0) return false;
        for ($i = 3; $i * $i <= $n; $i += 2) {
            if($n % $i == 0)
                return false;
        }
        return true;
    }

    function is_prime(&$n)
    {
        if ($this->primes[$n])
            return true;
        else
        {
            $result = $this->is_prime_raw($n);
            if ($result) $this->primes[$n] = true;
            return $result;
        }
    }

    function solve(&$n)
    {
        if ( $n % 2 == 0 ) {
            $start = $n + 1;
        } else {
            $start = $n + 2;
        }
        $ret = 0;
        for ($i = $start; $i <= $n * 2; $i += 2) {
            if ($this->is_prime($i)) {
                $ret += 1;
            }
        }
        return $ret;
    }
}

$solver = new Solver();
while(true)
{
    $val = (int)fgets(STDIN);
    if ($val == 0) {
        break;
    } else {
        printf($solver->solve($val) . "\n");
    }
}
?>
