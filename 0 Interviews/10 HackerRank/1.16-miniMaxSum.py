#!/bin/python3

import math
import os
import random
import re
import sys

#
# Complete the 'miniMaxSum' function below.
#
# The function accepts INTEGER_ARRAY arr as parameter.
#
# https://www.hackerrank.com/challenges/mini-max-sum

def miniMaxSum(arr):
    maxx = 0
    minn = sum(num for i, num in enumerate(arr) if i != 0)
    for i in range(len(arr)):
        summ = sum(num for j, num in enumerate(arr) if i != j)
        if summ > maxx:
            maxx = summ
        elif summ < minn:
            minn = summ
    print(minn, maxx)
    return [minn, maxx]
        

if __name__ == '__main__':
    arr = list(map(int, input().rstrip().split()))
    miniMaxSum(arr)
