int main(void)
{
    /* we hope that nobody will ever do that */
    __asm__ __volatile("rdtime ra":::"ra");
    return 0;
}
