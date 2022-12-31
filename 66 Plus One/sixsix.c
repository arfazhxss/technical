/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* plusOne(int* digits, int digitsSize, int* returnSize){
    int t = 1;
    int number=0;
    for (int digitsSize-1; i>-1; i++) {
        number+=digits[i]*t;
        t*=10;
    }
    ++number;
    
}