#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>

int main() {
    pid_t pid = fork(); // Create child process [cite: 3, 8]

    if (pid < 0) {
        exit(1); // Demonstrate exit(1) for failure [cite: 6]
    } else if (pid == 0) {
        // Child Process [cite: 9]
        printf("Child: PID=%d, PPID=%d\n", getpid(), getppid()); // Display PID and PPID [cite: 4, 13]
        
        pid_t gpid = fork(); // Create grandchild [cite: 4]
        if (gpid == 0) {
            printf("Grandchild: My Roll No is 22\n"); // Display roll no [cite: 4]
            exit(0); // Demonstrate exit(0) [cite: 6]
        }
    } else {
        // Parent Process [cite: 5]
        printf("Parent: PID=%d, PPID=%d\n", getpid(), getppid()); // PID of all processes [cite: 5, 13]
        printf("Total Child processes created: 1\n"); // Display count [cite: 5]
        printf("Total Grandchild processes created: 1\n"); // Display count [cite: 6]
    }
    return 0;
}