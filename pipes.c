#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

#include <ctype.h>

int n;
int main(){
	pid_t p;
	int check = 3;
	int fd[2];
	pipe(fd);
	p = fork();
	if (p<0){
		printf("Fork unsuccessful");
	}
	else if (p>0){
		close(fd[0]);
		printf("Enter the number: ");
		scanf("%d", &n);
		write(fd[1], &n,sizeof(n));
		close(fd[1]);
	}
	else {
		close(fd[1]);
		read(fd[0], &n, sizeof(n));
		close(fd[0]);
		if (n%2 == 0){
			printf("Even");
		}
		else {
			printf("Odd");
		}
	}
}
