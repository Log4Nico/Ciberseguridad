# SquidGuard

Para acabar, vamos a configutar el paquete SquidGuard, para ello, necesitamos tener intalado el siguiente paquete:

![alt text](img/image.png)

Entramos en la configuración y vamos viendo:

`Services > SquidGuard Proxy Filter`

`General Settings`

Obviamente, habilitamos  el squidGuard, y habilitamos también el log para que registre actividad:

![alt text](img/image-1.png)

![alt text](img/image-2.png)

Aactivamos las `Blacklist` y ponemos la siguiente en `Blacklist URL`:

![alt text](img/image-3.png)

`Target categories`

Vamos a crear 2 categorias: _IPs bloqueadas_ y _IPs permitidas_.

![alt text](img/image-4.png)

> Me da to la pereza poner las IPs.

![alt text](img/image-5.png)

Basicamente hemos hecho una lista de IPs y palabras concretas que no se pueden buscar dentro de la RED.

Tambien se puede crear una lista de IPs permitidas... aunque no entiendo para que, puede ser que sirva en caso de bloquear todo y solo permitir las de esa lista idk.

`Blacklist`

Aquí podremos descargarnos la lista de que pusimos antes. Le damos a descargar y en `Common ACL` agregamos la lista:

![alt text](img/image-6.png)

![alt text](img/image-7.png)

> Aquí deberían aparecernos un montón de listas, pero la URL proporcionada ni si quiera existe...

![alt text](img/image-8.png)

Activamos los logs como siempre.

Y ya :)