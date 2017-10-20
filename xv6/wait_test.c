#include "types.h"
#include "user.h"

int main(void)
{
   printf(1,"This has no child, start waiting\n");   
   printf(1,"wait %d\n",wait(0));
   printf(1,"The process with no child has finished\n");
   int pid = fork();
   
   if(pid > 0) 
   {
      printf(1,"This has no child, start waiting\n");
     

