#include "param.h"
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"

int main(){
    int i;
    int start = getpid();
    int pid = fork();
    if(pid > 0){
        for(i = 0; i < 20 && pid > 0; i++){
            pid = fork();
        }
        if (pid == 0){
            int j = 0;
            if(getpid() == begin + 10){
                printf(1," pid = %d, high priority\n\n",getpid());
                setprio(60);
            }
            while(j++ < 30000000);
            exit(0);
        }
    }else if(pid == 0){
        int j = 0;
        while(j++ < 30000000);
        exit(0);
    }
    int ki = 1;
    int status;
    while(ki >= 0){
        ki = wait(&status);
        if(ki == begin+10)
            printf(1," [%d] done first\n",ki);
        else
            printf(1," [%d] done runing\n",ki);

    }
    exit(0);
    return 0;
}
