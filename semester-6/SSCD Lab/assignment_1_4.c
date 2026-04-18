#include<stdio.h>
int main(int argc,char *argv[]){
    if(argc<2){
        printf("Usage : ./od <input.txt> \n");
        return 1;
    }

    FILE *fptr = fopen(argv[1],"rb");
    if(!fptr) return 1;

    unsigned char ch;
    int count = 0;

    while(fread(&ch, 1,1, fptr)){
        if(count % 16 == 0){
            printf("\n %07o",count);
        }


        if(ch == '\n'){
            printf("    \\n");
        }
        else if (ch == '\t'){
            printf("    \\t");
        }
        else{
            printf("%4c",ch);
        }
        count++;
    }

    printf("\n%07o\n", count);
    fclose(fptr);
    return 0;
}