#include "param.h"
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"

int main(void){
    
	int start = getpid();
	int i, pid = fork();
	int status;
	if(pid > 0){
		for(i = 0; i < 20 && pid > 0; i++){
			pid = fork();
		}
		if (pid == 0){
			int j = 0;
			while(j++ < 1000);
			if(getpid() == start+5) sleep(30);
			printf(1,"pid = %d\n",getpid());
			if(getpid() == start+10){
				printf(1,"pid %d waiting for %d\n",start+10,start+5);
				int wpid = waitpid(start+5,&status,0);
				printf(1,"success clean %d\n",wpid);
			}
			if(getpid() == start+15){
				printf(1,"pid %d waiting for %d\n",start+15,start+5);
				int wpid = waitpid(start+5,&status,0);
				if(wpid == -1) printf(1,"no more waiting for %d\n",start+5);
			}
			if(getpid() == start+5) exit(1);
			exit(0);
		}
    	}else{
        	int j = 0;
        	while(j++ < 1000);
        	exit(0);
    	}
	int going = 1;
	while(going >= 0){
		going = wait(&status);
		printf(1,"kill %d process\n",going);
	};
	exit(0);
	return 0;
}
