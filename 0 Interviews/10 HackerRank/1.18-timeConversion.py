#!/bin/python3

import math
import os
import random
import re
import sys

#
# Complete the 'timeConversion' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING s as parameter.
#
# https://www.hackerrank.com/challenges/time-conversion

def timeConversion(s):
    if "AM" in s:
        s = s.split(':')
        s[-1] = s[-1].replace('AM', '')
        s[0] = s[0].replace('12', '00')
        return ':'.join(s)
    elif "PM" in s:
        s = s.split(':')
        s[-1] = s[-1].replace('PM', '')
        s[0] = str((int(s[0]) + 12) % 24) if s[0] != '12' else '12'
        return ':'.join(s)

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    s = input()

    result = timeConversion(s)

    fptr.write(result + '\n')

    fptr.close()

