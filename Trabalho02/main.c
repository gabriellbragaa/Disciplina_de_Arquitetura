#include <stdio.h>
 int funcao(int x){
 int a = 5;
 int b = x;

 return a+b;
 }
 int main (){
 int soma;
 soma = funcao (2);

 printf("soma eh:%d \n", soma);

 return 0;
}