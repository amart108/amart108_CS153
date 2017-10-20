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
      printf(1,"This Parent has a child, start waiting\n");      
      printf(1,"Wait, %d\n", wait(0));
      printf(1,"Parent finished\n");
   }
   else if(pid == 0)
   {   
      printf(1,"Child has started sleeping\n");      
      sleep(300);
      printf(1,"Child finished\n");
   }
   exit(0);
}
