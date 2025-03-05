# Un nuevo mundo

```
Uno de los clientes de nuestra empresa perdió el acceso a su sistema debido a un error desconocido. Supuestamente, es un "environmental activist"  muy popular. Como parte de la investigación, nos dijo que sus aplicaciones principales son navegadores, sus gestores de contraseñas, etc. 

Esperamos que puedas analizar este volcado de memoria y encontrar sus cosas importantes para devolvérnoslas.

Nota: Este reto está compuesto por 3 banderas.
```

## Procedimiento

Empezamos haciendo un análisis de los posibles perfíles del sistema:

![alt text](image.png)

Con la *pista* podemos sacar en claro 3 cosas:

- *environmental activist*(variables de entorno)
- Navegador
- Gestor de contraseñas

### Variables de entorno 

Mostramos las variables de entorno con el siguiente comando:

![alt text](image-1.png)
![alt text](image-2.png)
> Primera flag.

### Navegador

Lo único que se me ocurre que podamos hacer con el navegador es intentar exportar el historial y sacar algo de él:

![alt text](image-3.png)
> Resultado del pslist.

![alt text](image-11.png)

Dumpeamos el archivo, y lo abrimos con *sqlitebrowser*:

![alt text](image-12.png)

Ponemos la siguiente *Query* para ver el historial:

![alt text](image-13.png)

Y sacamos un enlace de mega, el cuál contiene un archivo zip, que al intentar extraerlo, nos pedirá una contraseña. La contraseña es el *sha1* de la flag del laboratorio *La suerte del principiante*:

![alt text](image-14.png)
![alt text](image-15.png)
> Tercera flag encontrada.

### Gestores de contraseñas

![alt text](image-4.png)
> pslist.

Rebuscando por la memoria, encontré este archivo:

![alt text](image-5.png)
>cmdline

Lo buscamos con filesacan y lo exportamos con dumpfiles:

![alt text](image-7.png)

Se nos habrá dumpeado un archivo con una extención rara, se la cambiamos a .kdbx y la abrimos con *keepass2*:

![alt text](image-6.png)

Nos pide una contraseña que aún no tenemos, vamos a buscarla con filesacan:

![alt text](image-8.png)
![alt text](image-9.png)
> Encontramos la contraseña de la base de datos del keepass.

![alt text](image-10.png)
> Y la segunda flag.