int main(void)
{
    __asm__ __volatile("rdtime zero");
    return 0;
}
