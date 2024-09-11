#!/bin/python3

import math
import os
import random
import re
import sys

#
# Complete the 'diagonalDifference' function below.
#
# The function is expected to return an INTEGER.
# The function accepts 2D_INTEGER_ARRAY arr as parameter.
#
#
# https://www.hackerrank.com/challenges/diagonal-difference

def diagonalDifference(arr):
    right = 0
    left = 0
    
    # #1
    # for i, column in enumerate(arr, start=0):
    #     print(i, ": ", column[i])
    #     right += column[i]
    # for j, column in enumerate(arr, start=0):
    #     column.reverse()
    #     left += column[j]
    
    # #2
    n = len(arr)
    for i in range(n):
        right += arr[i][i]
        left += arr[i][n - 1 - i]
        
    return abs(right - left)

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    n = int(input().strip())

    arr = []

    for _ in range(n):
        arr.append(list(map(int, input().rstrip().split())))

    result = diagonalDifference(arr)

    fptr.write(str(result) + '\n')

    fptr.close()
