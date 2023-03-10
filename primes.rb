class Primes
  # https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
  # https://www.geeksforgeeks.org/sieve-of-eratosthenes/
  def process(n)
    raise ArgumentError unless n
    raise 'N should be at least 1' if n < 1

    prime = Array.new(n+1, true)
    p = 2

    while (p*p <= n)
      if (prime[p])
        (p*p).step(n+1, p) do |i|
          prime[i] = false
        end
      end
      p += 1
    end

    primes = Array.new
    2.step(n+1, 1) do |p|
      primes << p if prime[p]
    end

    return primes
  end
end