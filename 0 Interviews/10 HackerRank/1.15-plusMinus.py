#!/bin/python3

import math
import os
import random
import re
import sys

#
# Complete the 'plusMinus' function below.
#
# The function accepts INTEGER_ARRAY arr as parameter.
#
# https://www.hackerrank.com/challenges/plus-minus

def plusMinus(arr):
    n = len(arr)
    precision = "{:.6f}"
    ratios = [
        sum(1 for num in arr if num > 0) / n,
        sum(1 for num in arr if num < 0) / n,
        sum(1 for num in arr if num == 0) / n
    ]
    print(*[precision.format(ratio) for ratio in ratios], sep="\n")

if __name__ == '__main__':
    n = int(input().strip())

    arr = list(map(int, input().rstrip().split()))

    plusMinus(arr)
