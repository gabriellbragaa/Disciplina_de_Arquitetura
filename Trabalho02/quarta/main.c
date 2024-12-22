#include <stdio.h>
int funcao(int x, int y);

int main (){


int soma;

soma = funcao (2, 3);
printf("soma eh:%d \n", soma);
return 0;
}

int funcao(int x, int y){
int a = x;

int b = y;

return a+b;


}