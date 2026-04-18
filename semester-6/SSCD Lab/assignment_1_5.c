#include <stdio.h>
#include <ctype.h>

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: ./strings <input.txt>\n");
        return 1;
    }

    FILE *fp = fopen(argv[1], "rb"); 
    if (!fp) return 1;

    char buffer[100];
    int count = 0;
    int ch;

    while ((ch = fgetc(fp)) != EOF) {
        if (isprint(ch)) {
            buffer[count++] = (char)ch;
            if (count == 99) { 
                buffer[count] = '\0';
                printf("%s", buffer);
                count = 0;
            }
        } else {
            if (count >= 4) { 
                buffer[count] = '\0';
                printf("%s\n", buffer);
            }
            count = 0;
        }
    }
    
    fclose(fp);
    return 0;
}