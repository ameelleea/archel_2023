#include <stdio.h>

int main(void)
{
    int n = 8;
    int a[n];
    int i;

    for (i = 0; i < n; i++)
    {
        if (i < 2)
        {
            a[i] = 1;
        }
        else
        {
            a[i] = a[i-1] + a[i-2];
        }

        printf("%d ", a[i]);
    }

    return(0);
}
