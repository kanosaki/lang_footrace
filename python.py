#!/usr/bin/env python3
#-*- coding: utf-8 -*-

import sys

class Solver(object):
    def __init__(self):
        self.memo = set([2,3])

    def solve(self, n):
        return len([ x for x in range(n+1, n*2 + 1) if x % 2 != 0 and self.is_prime(x) ])

    def is_prime(self, n):
        if n in self.memo:
            return True
        else:
            result = self.is_prime_raw(n)
            if result:
                self.memo.add(n)
            return result

    def is_prime_raw(self, n):
        if n < 2: return False
        if n == 2 : return True
        if n % 2 == 0: return False
        i = 3
        while i * i <= n:
            if n % i == 0:
                return False
            i += 2
        return True

class Solver3(Solver):
    def _solve_inner(self, start, end):
        return sum(1 for _ in filter(self.is_prime, range(start, end + 1)))


solver = Solver()

while True:
    val = int(input())
    if val == 0:
        break
    print(solver.solve(val))


