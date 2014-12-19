print "Hello World"

def fib(n):
    """Print the Fibonacci series up to n."""
    a, b = 0, 1
    while b < n:
        print b,
        a, b = b, a + b
    return b

def primes(int kmax):
    cdef int n, k, i
    cdef int p[100000]
    result = []
    if kmax > 100000:
        kmax = 100000
    k = 0
    n = 2
    while k < kmax:
        i = 0
        while i < k and n % p[i] != 0:
            i = i + 1
        if i == k:
            p[k] = n
            k = k + 1
            result.append(n)
        n = n + 1
    return result

def primesV2(kmax):
    #p = [0] * 100000
    cdef int p[100000]
    #cdef int n, k, i
    result = []
    if kmax > 100000:
        kmax = 100000
    k = 0
    n = 2
    while k < kmax:
        i = 0
        while i < k and n % p[i] != 0:
            i = i + 1
        if i == k:
            p[k] = n
            k = k + 1
            result.append(n)
        n = n + 1
    return result

