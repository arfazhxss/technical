#!/bin/python3

import math
import os
import random
import re
import sys

#
# Complete the 'dynamicArray' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts following parameters:
#  1. INTEGER n
#  2. 2D_INTEGER_ARRAY queries
#
#
#  https://www.hackerrank.com/challenges/dynamic-array/problem?isFullScreen=true
#

def dynamicArray(n, queries):
    lastAnswer=0
    ansArr = []
    arr = [[] for _ in range(n)]

    for column in queries:
        if column[0]==1:
            a = ((column[1] ^ lastAnswer) % n)
            arr[a].append(column[2])
        else:
            a = ((column[1] ^ lastAnswer) % n)
            b = column[2] % len(arr[((column[1] ^ lastAnswer) % n)])
            lastAnswer = arr[a][b]
            ansArr.append(lastAnswer)
    return ansArr
    

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')
    first_multiple_input = input().rstrip().split()
    n = int(first_multiple_input[0])
    q = int(first_multiple_input[1])
    queries = []

    for _ in range(q):
        queries.append(list(map(int, input().rstrip().split())))

    result = dynamicArray(n, queries)

    fptr.write('\n'.join(map(str, result)))
    fptr.write('\n')

    fptr.close()
