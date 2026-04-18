#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<signal.h>

struct Student{
    char name[30];
    struct Student *next;
};

int main(){
    pid_t pid = fork();

    if(pid<0){
        perror("Fork Failed");
        exit(1);
    }

    if(pid == 0){
        print("Child PID is : %d\n",getpid());
        print("Parent PID :%d\n",getppid());

        struct Student *head = NULL, *temp = NULL;
        for(int = 1; i<=40; i++){
            struct Student *node = malloc(sizeof(struct Student));
            sprintf(node->name, "Student_%d",i);
            node->next = NULL;
            if(!head)  head = node;
            else temp->next = node;
            temp = node;
        }

        printf("Linked list of 40 students created.");

        pid_t new_ppid = getppid();
        printf("PPID after linekd list creattion is : %d\n", new_ppid);

        if(new_ppid == 1){
            printf("New PPID is 1, Child killing\n");
            kill(getppid(), SIGKILL);
        }

        printf("Child finsihed normally.\n"); 
    }

    else {
        printf("Parent PID : %d\n",getpid());
        printf("Parent exiting immediately without wait. \n");
        exit(0)
    }
    return 0;
}