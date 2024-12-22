#include <stdio.h>

int main() {
    float preco = 85.00;
    

    if (preco <= 80.00) {
        printf("Classificação: Barato\n");
    } else if (preco <= 120.00) {
        printf("Classificação: Normal\n");
    } else if (preco <= 200.00) {
        printf("Classificação: Caro\n");
    } else {
        printf("Classificação: Muito Caro\n");
    }

    return 0;
}
