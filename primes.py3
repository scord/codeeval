import sys, math
test_cases = open(sys.argv[1], 'r')
for test in test_cases:
    if test:
        test = int(test)
        primes = [False] * 2 + [True] * (test - 2)
        for i in range(2, int(math.sqrt(test)) + 1):
            if primes[i] == True:
                for j in range(i*2, test):
                    if j % i == 0:
                        primes[j] = False
        first = True
        for n in range(len(primes)):
            if primes[n]:
                if first:
                    sys.stdout.write(str(n))
                    first = False
                else:
                    sys.stdout.write("," + str(n))
        print()
test_cases.close()
