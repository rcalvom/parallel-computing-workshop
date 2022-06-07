# Parcial 1 - Computación paralela y distribuida

## Autores

* Ricardo Andrés Calvo Méndez
* Jorge Aurelio Morales Manrique


## Observaciones

1. Para ejecutar los test se ha creado el script `execute_test.sh`, para ejecutar este archivo se corre el siguiente comando:

```
./execute_test.sh
```

2. El anterior script realizará las siguientes tareas:

    * Hará la multiplicación de matrices de diferentes tamaños usando Openmp, es decir, parelelizando con hilos
    * Hará la multiplicación de matrices de diferentes tamaños usando CUDA, es decir, parelelizando usando la tarjeta gráfica Nvidia
    * Hará la multiplicación de matrices de diferentes tamaños usando CUDA pero con técnica de tiling
    
    