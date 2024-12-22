#include <stdio.h>

// Declaração da função par
int par(int x);

int main() {
    int a;
    a = par(4);  // Chama a função par e armazena o resultado em 'a'

    if (a == 1) {
        printf("impar = %d\n", a);  // Imprime "impar" se 'a' for 1
    } else {
        printf("par = %d\n", a);  // Imprime "par" se 'a' for 0
    }

    return 0;
}

// Implementação da função par
int par(int x) {
    return x % 2;  // Retorna o resto da divisão de x por 2
}
