# Squid

Usaremos Squid como proxy para inspeccionar el tráfico https.

Para la configuración de Squid, necesitaremos tener instalado el siguiente paquete:

![alt text](img/image.png)

Lo primero que vamos a hacer es configurar los certificados.

`System > Certificate`

Creamos una _CA_ (Authorities):

> [NOTE]
> Sin tildes

![alt text](img/image-1.png)

![alt text](img/image-2.png)

![alt text](img/image-3.png)

> Quedaría así.

Ahora tenemos que configurar el proxy:

`Services > Squid Proxy Server`

`Local cahce`

![alt text](img/image-4.png)

![alt text](img/image-5.png)

> Estas configuraciones son un poco _depende_, esto es como _lo general_.

Dejamos el resto como está y volvemos a `general` para activar el proxy:

![alt text](img/image-6.png)

![alt text](img/image-7.png)

> De esta forma, camuflamos el proxy para que no sea visible.

Para análizar y filtrar el tráfico HTTP/HTTPS, marcamos y ponemos nuestra _CA_:

![alt text](img/image-8.png)

Activamos los logs:

![alt text](img/image-9.png)

POr último, modificamos estas pijadas para los logs:

![alt text](img/image-10.png)

En la pestaña `ACLs`,