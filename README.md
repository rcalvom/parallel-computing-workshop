# Implementación de un efecto sobre una imágen

## Autores

* Ricardo Andrés Calvo Méndez
* Jorge Aurelio Morales Manrique


## Observaciones

1. Para ejecutar los test se ha creado el script `execute_test.sh`, para ejecutar este archivo se ejecuta el siguiente comando:

```
./execute_test.sh
```

2. El anterior script realizará las siguientes tareas:

    * Creará las carpetas necesarias para las ejecuciones
    * Compilará el proyecto escrito en el lenguaje C usando el comando `make build`
    * Ejecutará los test de aplicación de filtro a las imágenes con los tamaños 4k, 1080p y 720p con 1, 2, 4, 8 hilos.
    * Se generarán las gráficas de tiempos y speed up usando un script de python y la libreria matplotlib
    * Compilará el reporte final usando `pdflatex`
    