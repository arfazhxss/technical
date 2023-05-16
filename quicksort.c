#include <stdio.h>

void swap(int *a, int *b)
{
    int t = *a;
    *a = *b;
    *b = t;
}

int partition(int a[], int first, int last)
{
    int l = first;
    int r = last;
    while (l != r)
    {
        if (a[r] >= a[l])
        {
            r--;
        }
        else if (a[l + 1] <= a[l])
        {
            swap(&a[l + 1], &a[l]);
            l++;
        }
        else
        {
            swap(&a[l + 1], &a[r]);
        }
    }
    return l;
}

void quicksort_rec(int a[], int first, int last)
{
    if (first >= last)
    {
    }
    else
    {
        int position = partition(a, first, last);
        quicksort_rec(a, first, position - 1);
        quicksort_rec(a, position + 1, last);
    }
}

void quicksort(int a[], int n)
{
    quicksort_rec(a, 0, n - 1);
}

int main()
{
    printf("Test 3");
}
