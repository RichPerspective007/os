#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>

int main(){
	pid_t p;
	p = fork();
	if (p < 0){
		printf("Fork unsuccessful.");
	}
	else if (p > 0){
		sleep(3);
		printf("I am parent with ID: %d\n", getpid());
		printf("My child is: %d\n", p);
        }
	else {
		printf("My parent is: %d\n", getppid());
		printf("I am child with ID: %d\n", getpid());
        }
}
