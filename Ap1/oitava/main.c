#include <stdio.h>

#define SIZE 10

void findSecondMinMax(int arr[], int size, int *secondMin, int *secondMax) {
    int min = arr[0], max = arr[0];
    *secondMin = *secondMax = 0;
    
    // Inicializa os valores de segundo menor e segundo maior
    *secondMin = *secondMax = arr[0];
    
    // Encontrar o menor e o maior valor
    for (int i = 1; i < size; i++) {
        if (arr[i] < min) {
            *secondMin = min;
            min = arr[i];
        } else if (arr[i] < *secondMin && arr[i] != min) {
            *secondMin = arr[i];
        }
        
        if (arr[i] > max) {
            *secondMax = max;
            max = arr[i];
        } else if (arr[i] > *secondMax && arr[i] != max) {
            *secondMax = arr[i];
        }
    }
}

int main() {
    int arr[SIZE];
    int secondMin, secondMax;
    
    printf("Digite 10 números:\n");
    for (int i = 0; i < SIZE; i++) {
        printf("Número %d: ", i + 1);
        scanf("%d", &arr[i]);
    }
    
    // Encontrar o segundo menor e o segundo maior
    findSecondMinMax(arr, SIZE, &secondMin, &secondMax);
    
    printf("O segundo menor valor é: %d\n", secondMin);
    printf("O segundo maior valor é: %d\n", secondMax);
    
    return 0;
}
