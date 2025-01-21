#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <semaphore.h>
#include <pthread.h>

int sharedresource=0, reader_count=0;
sem_t wb,mutex;

void* reader(void* args){
	for(int i=0; i<5; i++){
		sem_wait(&mutex);
		reader_count++;
		if (reader_count == 1){
			sem_wait(&wb);
		}
		sem_post(&mutex);
		printf("Reading shared resource value %d\n", sharedresource);
		sem_wait(&mutex);
		reader_count--;
		if (reader_count == 0){
			sem_post(&wb);
		}
		sem_post(&mutex);
	}
}
void* writer(void* args){
	for(int i=0; i<3; i++){
		sem_wait(&wb);
		printf("Writer updating shared resource value from %d to %d\n", sharedresource, sharedresource+1);
		sharedresource++;
		sem_post(&wb);
	}
}

int main(){
	sem_init(&wb, 0, 1);
	sem_init(&mutex, 0, 1);
	pthread_t readers[5], writers[2];
	for(int i=0; i<5; i++){
		pthread_create(&readers[i], NULL, reader, NULL);
	}
	for(int i=0; i<2; i++){
                pthread_create(&writers[i], NULL, writer, NULL);
        }
	for(int i=0; i<5; i++){
                pthread_join(readers[i], NULL);
        }
        for(int i=0; i<2; i++){
                pthread_join(writers[i], NULL);
        }
}
