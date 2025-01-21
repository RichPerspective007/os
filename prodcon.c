#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>

sem_t empty,full,mutex;
int in=0,out=0;
int buffer[5];

void* prod(void* args){
	for(int i=0; i<5; i++){
		sem_wait(&empty);
		sem_wait(&mutex);
		buffer[in]=i;
		printf("%d produced at index %d\n", i, in);
		in=(in+1)%5;
		sem_post(&mutex);
		sem_post(&full);
	}
}

void* con(void* args){
        for(int i=0; i<5; i++){
                sem_wait(&full);
                sem_wait(&mutex);
                int item = buffer[out];
                printf("%d consumed at index %d\n", item, out);
                out=(out+1)%5;
                sem_post(&mutex);
                sem_post(&empty);
         }
}

int main() {
	sem_init(&empty,0,5);
	sem_init(&mutex,0,1);
	sem_init(&full,0,0);
	pthread_t producers[5], consumers[5];
	for(int i=0; i<5; i++){
		pthread_create(&producers[i], NULL, prod, NULL);
	}
	for(int i=0; i<5; i++){
                pthread_create(&consumers[i], NULL, con, NULL);
	}
	for(int i=0; i<5; i++){
		pthread_join(producers[i], NULL);
	}
	for(int i=0; i<5; i++){
		pthread_join(consumers[i], NULL);
	}
	return 0;
}
