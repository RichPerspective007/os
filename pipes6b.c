#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>

int n;
int main(){
	pid_t p;
	int fd[2];
	pipe(fd);
	p = fork();
	if (p < 0){
		printf("Fork unsuccessful.");
	}
	else if (p > 0){
		close(fd[0]);
		printf("Enter the number: ");
		scanf("%d", &n);
		write(fd[1], &n, sizeof(n));
		close(fd[1]);
	}
	else {
		close(fd[1]);
		read(fd[0], &n, sizeof(n));
		int f=1;
		if (n <= 0){
			printf("Inputs <= 0 are invalid");
			f = -1;
		}
		if (n == 1) {
			printf("1 is a unique number, neither prime nor composite.");
			f = -1;
			}
		for(int i=2; i<n; i++){
			if (n%i == 0){
				f=0;
				break;
			}
		}
		if (f == 0){
			printf("%d is a composite number", n);
		}
		else if (f == 1){
			printf("%d is a prime number", n);
		}
	}	
}
