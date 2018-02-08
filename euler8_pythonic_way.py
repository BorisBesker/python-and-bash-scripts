def get_primes(n):
    """
    Returns prime numbers below n
    Args:
        n (int): Upper limit which must not be exceeded.
    Yields:
        int: The next prime number in the range of 2 to n(excluding n)
    """
    if n <= 2:
        raise StopIteration
    yield 2
    for i in range(3, n, 2):
        for x in range(3, int(i**0.5)+2, 2):
            if not i % x:
                break
        else:
            yield i

suma = sum(get_primes(1000000))
print(suma)
