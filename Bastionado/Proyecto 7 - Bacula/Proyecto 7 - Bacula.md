# Proyecto 7 - Bacula

![](attachments/Pasted%20image%2020250218153918.png)

Nicolás Ruiz Ruiz
Bastionado de Redes y Sistemas
19 de febrero de 2025

---
# Índice

- [Introducción](#introducción)
- [Requisitos](#requisitos)
- [Instalación](#instalación)
  - [Instalación servidor](#instalación-servidor)
  - [Preinstalación](#preinstalación)
  - [Instalación Bacula](#instalación-bacula)
  - [Instalación Baculum](#instalación-baculum)
    - [Baculum Web](#baculum-web)
    - [Baculum API](#baculum-api)
  - [Instalación clientes](#instalación-clientes)
    - [Instalación Ubuntu](#instalación-ubuntu)
    - [Instalación Windows](#instalación-windows)
- [Estrategia de copias de seguridad](#estrategia-de-copias-de-seguridad)
- [Configuración copias de seguridad](#configuración-copias-de-seguridad)

# Introducción

En este proyecto, se nos ha pedido realizar un plan de copias de seguridad de 2 equipos(Linux y Windows). Para ello vamos a hacer uso de la herramienta **Bacula** que la podemos encontrar para varias distribuciones de Linux, y además, como no tiene **interfaz gráfica**, vamos a usar **Baculum** que aporta una interfaz a través del navegador.

# Requisitos

- Servidor Ubuntu.
	Podemos usar cualquier versión de Ubuntu Server para la instalación de *Bacula*, pero ya desde la página oficial nos alientan a que usemos una versión anterior a la 20.04.
	
- Cliente Linux.
	Se puede usar cualquier Linux, en mi caso voy a usar Ubuntu 20.04.
	
- Cliente Windows.
	para el cliente de Windows, voy a usar mi propio ordenador con Windows 11.

Aquí abajo dejo los enlaces necesarios para descargar la ISO de los sistemas utilizados:

[Ubuntu server/desktop](https://releases.ubuntu.com/focal/)

[Windows 11](https://www.microsoft.com/es-es/software-download/windows11)

# Instalación

Procedamos con la instalación de los servicios necesarios. Esta sección esta dividida en la instalación en los servidores y en los clientes, además de la instalación de *Baculum* en el servidor.

## Instalación servidor

Como dije antes, la instalación de del servidor se divide en 2 secciones, la instalación del servicio de copias de seguridad, y la instalación de interfaz gráfica mediante apache. Empecemos poco ya que tenemos muchas cosas que tocar.

## Preinstalación

Antes de instalar nada, vamos a actualizar el sistema con los siguientes comandos:

```bash
sudo apt update && sudo apt upgrade -y
```

*Bacula* hace uso de bases de datos para almacenar información sobre las copias de seguridad. Podemos usar MariaDB, Mysql o PostgreSQL, en mi caso usaré MariaDB:

```bash
sudo apt install mariadb-server -y
```

Podemos ejecutar el script de seguridad para *automatizar* la seguridad de la base de datos. Nos harán muchas preguntas, ponemos **Y** en todas.

```bash
sudo mysql_secure_installation
```
## Instalación Bacula

Procedamos con la instalación de Bacula en el servidor. Empecemos instalando los siguientes paquetes:

```bash
sudo apt install bacula-server bacula-client bacula-director-mysql bacula-sd bacula-console -y
```

Este comando instalará:  
- **Bacula Director** (gestiona las copias de seguridad)  
 - **Bacula Storage Daemon** (maneja el almacenamiento de backups)  
 - **Bacula File Daemon** (cliente para hacer copias de seguridad)  
 - **Bacula Console** (interfaz para administrar Bacula)  
 - **Soporte para MySQL/MariaDB**

La instalación nos hará 2 preguntas:

**Configuración del correo(Postfix)**
![](attachments/Pasted%20image%2020250218162125.png)

Podemos elegir **sin configuración**, para no configurar ningún correo, **sitio de internet**, si quisiéramos poner un **correo personal** o correo local si tuviéramos un servidor SMTP

**Configuración de la base de datos**
![](attachments/Pasted%20image%2020250218164541.png)

Obviamente le decimos que sí para que configure automáticamente la base de datos.

---
Veamos si los servicios están activos.

```bash
sudo systemctl status bacula-director.service bacula-sd.service bacula-fd.service
```

![](attachments/![[Pasted%20image%2020250218171239.png]].png)
>Hago el grep para que se vean los 3 en la misma pantalla.

Creemos ahora el usuario bacula en la base de datos. Para ello pondremos los siguientes comandos:

```bash
sudo mysql -u root -p
```
```mysql
CREATE USER IF NOT EXISTS 'bacula'@'localhost' IDENTIFIED BY 'TuContraseñaSegura';
GRANT ALL PRIVILEGES ON bacula.* TO 'bacula'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```
> Estoy usando la contraseña **bacula** ya que estamos en un entorno de prueba.

Ahora que la base de datos está configurada, toca configurar el *Bacula Director* para que esté conectado a esta.

```bash
sudo nano /etc/bacula/bacula-dir.conf
```

![](attachments/Pasted%20image%2020250218171733.png)
> Estos son mis datos, lo único que no tendríamos en común es el dbuser, y la dbpassword.

```bash
sudo systemctl restart bacula-director
sudo systemctl status bacula-director
```

Ya tendríamos **Bacula** instalado en nuestro servidor, podríamos probar si la configuración es correcta con:

![](attachments/Pasted%20image%2020250218172143.png)

Si aparecen errores, o no podemos iniciar *bconsole* ejecute el siguiente comando y verifique que error tienes.

```bash
sudo systemctl status bacula-director.service bacula-sd.service bacula-fd.service
```
## Instalación Baculum

Una vez instalado **Bacula** y comprobado que funcione, vamos a instalar la interfaz gráfica con **Baculum**.
Debemos crear y editar el siguiente archivo:

```bash
sudo nano /etc/apt/sources.list.d/baculum.list
```

Y escribir lo siguiente:

- Si tienes Bacula Director <= 9.6

```bash
deb [ arch=amd64 ] http://www.bacula.org/downloads/baculum/stable/ubuntu focal main
deb-src http://www.bacula.org/downloads/baculum/stable/ubuntu focal main
```

- Si tienes Bacula Director >= 11.0

```bash
deb [ arch=amd64 ] http://www.bacula.org/downloads/baculum/stable-11/ubuntu focal main
deb-src http://www.bacula.org/downloads/baculum/stable-11/ubuntu focal main
```

Para saber la versión de **Bacula Director**, ejecutar el siguiente comando:

![](attachments/Pasted%20image%2020250218175109.png)

Actualizamos los paquetes.

```bash
sudo apt update
```

E instalamos Baculum API y Baculum Web. Yo lo voy a hacer con Apache Web, así que ejecutamos los siguientes comandos:

```bash
sudo apt install apache2 baculum-common baculum-api baculum-web baculum-api-apache2
```

Habilitamos el módulo *rewrite* de Apache.

```bash
a2enmod rewrite
```

Y habilitamos el virtual host para ambos servicios.

```bash
a2ensite baculum-api
a2ensite baculum-web
```

![](attachments/Pasted%20image%2020250218191036.png)

Por último reiniciamos apache y vemos si está activo.

```bash
systemctl restart apache2
systemctl status apache2
```

Ahora podremos acceder a los puertos 9095(web) y 9096(api) del servidor. Vamos a configurar ambas servicios.
### Baculum Web

![](attachments/Pasted%20image%2020250218184543.png)
> http://{ip_servidor}:9095/web/
> admin/admin

Puede pasar que al autenticarnos, la página nos devuelva un error, si es el caso, debemos modificar los permisos de la siguiente carpeta:

![](attachments/Pasted%20image%2020250218192446.png)
> No pude replicar el error y lo busque en internet, por eso la calidad

```bash
sudo chown -R www-data:www-data /usr/share/baculum/
sudo chmod -R 755 /usr/share/baculum/
sudo systemctl restart apache2
```

De esta forma ya quedaría solucionado el problema.

Entremos ahora en la configuración del **Baculum**

![](attachments/Pasted%20image%2020250218192709.png)

Elegimos el idioma que más queramos y le damos a siguiente, en esta sección deberemos configurar la conexión con la API, si lo has hecho igual que yo, el login será bacula/bacula:

![](attachments/Pasted%20image%2020250218193700.png)

Si nos sale algún error, debemos configurar la API antes. Como se ve en la imagen, pasamos correctamente los test, le damos a siguiente y guardamos la configuración
### Baculum API

Pasemos ahora a la configuración de la AIP de Baculum.

![](attachments/Pasted%20image%2020250218193811.png)
> http://{ip_servidor}:9096/panel/

Aquí podremos configurar un nuevo usuario para la API(muy recomendado)

![](attachments/Pasted%20image%2020250218194010.png)
> Si cambiamos aquí, tendremos que cambiar la configuración de la web

![](attachments/Pasted%20image%2020250218194058.png)

Empecemos con la configuración eligiendo un idioma y le damos a siguiente. La primera configuración, será sobre la base de datos que creamos antes:

![](attachments/Pasted%20image%2020250218194817.png)

Si se ha seguido la documentación al pie de la letra, esto bastará para pasar el test, si no es el caso, rellenar con tus datos. Configuración de la interfaz de comandos:

![](attachments/Pasted%20image%2020250218195347.png)
> Si da fallos, revisar que los permisos sean los correctos.

![](attachments/Pasted%20image%2020250218195506.png)

Si no son así, poner los siguientes comandos:

```bash
sudo chown -R root:www-data /usr/sbin/bconsole
sudo chmod -R 750 /usr/sbin/bconsole
sudo chown -R root:bacula /etc/bacula/bconsole.conf
sudo chmod -R 660 /etc/bacula/bconsole.conf
sudo systemctl restart apache2
```

Ya no debería darnos error en el test. Tercera configuración, interfaz del Bacula.

![](attachments/Pasted%20image%2020250218200059.png)

Estos van a dar error 100%, ya que no existen esos archivo, bueno, si que existen, pero no están en esa carpeta. Vamos a crear un enlace simbólico a esos archivos de la siguiente forma:

```bash
sudo ln -s /usr/sbin/bconsole /usr/sbin/bbconsolejson
sudo ln -s /usr/sbin/bacula-dir /usr/sbin/bdirjson
sudo ln -s /usr/sbin/bacula-sd /usr/sbin/bsdjson
sudo ln -s /usr/sbin/bacula-fd /usr/sbin/bfdjson
sudo chown root:www-data /usr/sbin/bdirjson /usr/sbin/bsdjson /usr/sbin/bfdjson /usr/sbin/bbconsolejson
sudo chmod 750 /usr/sbin/bdirjson /usr/sbin/bsdjson /usr/sbin/bfdjson /usr/sbin/bbconsolejson
sudo systemctl restart apache2
```

Ahora si que sí, podremos pasar los test a la perfección. Si bconsole da error
Si lo anterior no da fallo, esto tampoco debería:

![](attachments/Pasted%20image%2020250218204050.png)

Dejamos la autenticación básica y terminamos la instalación de Bacula y Baculum en el servidor.
## Instalación clientes

En este apartado nos centraremos en la instalación del cliente de Bacula en los 2 clientes, así como su configuración en el servidor.
### Instalación Ubuntu

Para instalar Bacula en un cliente Ubuntu debemos ejecutar el siguiente comando:

```bash
sudo apt update
sudo apt install bacula-client -y
```

Debemos editar el archivo /etc/bacula/bacula-fd.conf y poner lo siguiente:

![](attachments/Pasted%20image%2020250218210953.png)

Los datos del servidor los podemos encontrar en su archivo con el mismo nombre. En **Director**, ponemos el nombre y contraseña del servidor:

![[Pasted image 20250218211131.png]]
![](attachments/Pasted%20image%2020250218162125.png)

En **FileDaemon**, debemos establecerle un nombre al cliente, y le ponemos su IP. ¡Ojo! No vale poner localhost, tenemos que poner la IP del cliente.
Ahora, en el servidor, creamos al cliente en el archivo /etc/bacula/bacula-dir.conf.

![[Pasted image 20250218211444.png]]
![](attachments/Pasted%20image%2020250218162125.png)
> Hay un cliente por defecto que es mejor no tocarlo.

Reiniciamos los servicios necesarios:

```bash
#Cliente
sudo systemctl restart bacula-fd
sudo systemctl enable bacula-fd
#Servidor
sudo systemctl restart bacula-dir
sudo systemctl restart bacula-sd
```

Comprobamos que el puerto 9102 del cliente está en escucha:

![](attachments/Pasted%20image%2020250218212911.png.png)

Y comprobamos la conexión desde el servidor.

![](attachments/Pasted%20image%2020250218213106.png)

![](attachments/Pasted%20image%2020250218213328.png)

Ya tendríamos Bacula Cliente instalado en un Ubuntu Desktop 20.04.
### Instalación Windows

Instalar Bacula en Windows es más sencillo, nos descargaremos el archivo.exe del siguiente [repositorio](https://www.bacula.org/downloads/Bacula-9.6.7/)

![](attachments/Pasted%20image%2020250218213943.png)
> Falso positivo(espero)

![](attachments/Pasted%20image%2020250218214027.png)

Procedemos con la instalación. Le damos a siguiente y aceptamos los términos. Le damos a instalación personalizada y en tipo de instalación ponemos Cliente.

![](attachments/Pasted%20image%2020250218215029.png)

La contraseña nos la podemos inventar, ya que no está configurada en ningún lado(aún)

![](attachments/Pasted%20image%2020250218215318.png)

Aquí ponemos la información del servidor:

- DIR Name: server-dir
- DIR Password: NicolasRuizRuiz2004Proyecto-7
- DIR Address: 192.168.1.80
- DIR: 9101

![](attachments/Pasted%20image%2020250218215637.png)

Le damos a siguiente, y ya estaría instalado el cliente en Windows 11.
En el servidor, tenemos que añadir al cliente:

![](attachments/Pasted%20image%2020250219103340.png)

Reiniciamos los servicios del servidor:

```bash
sudo systemctl restart bacula-dir.service
sudo systemctl restart bacula-fd.service
sudo systemctl restart bacula-sd.service
```

![](attachments/Pasted%20image%2020250218215902.png)

Y ya tendríamos instalado los 3 clientes y conectados al servidor.

# Estrategia de copias de seguridad

Establecer estrategias de copias de seguridad sirven para muchas cosas, entre ellas encontramos:

- Minimizar los daños en caso de perdidas.
- Automatizar respaldos y evitar la intervención humana.
- Facilitar la recuperación de la información.

Existen 3 tipos de backups, completas, diferenciales e incrementales. El uso de estas va un poco ligada a la opinión de los técnicos, por ejemplo, yo pienso que la mejor forma de copiar los datos es diferenciales de lunes a jueves, y los viernes una completa.

En cuanto a la preservación de las copias, diría que con guardar un máximo de 5 copias completas de cada equipo guardadas en el propio servidor están bien, aunque lo correcto sería guardarlas en varios sitios más como discos externos, NAS y en la nube.
# Configuración copias de seguridad

Para aplicar y configurar las copias de seguridad debemos editar el archivo

```bash
sudo nano /etc/bacula/bacula-dir.conf
```

Y editar los siguientes apartados:

```bash
# JobDefs
JobDefs {                                                                            Name = "DefaultJob"                                                                Type = Backup                                                                      Level = Incremental                                                                Client = server-fd                                                                 FileSet = "Full Set"                                                               Schedule = "WeeklyCycle"                                                           Storage = File1                                                                    Messages = Standard                                                                Pool = Default                                                                     SpoolAttributes = yes                                                              Priority = 10                                                                      Write Bootstrap = "/var/lib/bacula/%c.bsr"                                       }
```

![](attachments/Pasted%20image%2020250219120332.png)

```bash
# Schedule
Schedule {
  Name = "WeeklyCycleAfterBackup"
  Run = Full sun-sat at 23:10
}
```

![](attachments/Pasted%20image%2020250219121142.png)

```bash
# Pool
Pool {
  Name = Default
  Pool Type = Backup
  Recycle = yes
  AutoPrune = yes
  Volume Retention = 35 days  # Retiene copias completas por 5 semanas
  Maximum Volume Bytes = 50G
  Maximum Volumes = 5
}
```

![](attachments/Pasted%20image%2020250219121342.png)

```bash
# Job
Job {
  Name = "Backup-Diff-Ubuntu"
  JobDefs = "DefaultJob"
  Level = Differential
  Client = cliente-ubuntu-fd
}

Job {
  Name = "Backup-Full-Ubuntu"
  JobDefs = "DefaultJob"
  Level = Full
  Client = cliente-ubuntu-fd
}

Job {
  Name = "Backup-Diff-Win11"
  JobDefs = "DefaultJob"
  Level = Differential
  Client = nico-win11-fd
}

Job {
  Name = "Backup-Full-Win11"
  JobDefs = "DefaultJob"
  Level = Full
  Client = nico-win11-fd
}

```

![](attachments/Pasted%20image%2020250219121828.png)

Ya estarían, ahora tenemos que reiniciar los servicios en el servidor:

```bash
sudo systemctl restart bacula-director
sudo systemctl restart bacula-fd
sudo systemctl restart bacula-sd
```

![](attachments/Pasted%20image%2020250219122430.png)

En la pestaña *jobs* del Baculum, podremos ver los trabajos que hemos creado anteriormente. Si le damos a *Detalles* del primero, podremos correr la tarea manualmente:

![](attachments/Pasted%20image%2020250219122647.png)

![](attachments/Pasted%20image%2020250219122717.png)

Y ya habríamos acabado con la configuración de las copias de seguridad en el servidor.

# Conclusión

Se logró implementar un sistema de copias de seguridad eficiente utilizando Bacula y Baculum, asegurando la automatización y gestión centralizada de los respaldos en clientes Linux y Windows. La estrategia adoptada, con copias diferenciales diarias y completas semanales, optimiza el almacenamiento y la recuperación de datos. La integración con MariaDB y Apache facilita la administración y monitoreo del sistema. En general, este proyecto demuestra la importancia de una planificación adecuada en la protección de datos, garantizando su disponibilidad y seguridad ante posibles fallos.
