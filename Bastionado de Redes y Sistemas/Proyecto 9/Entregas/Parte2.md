# Parte 2 - Configurar certificado para permitir conexión HTTPS

En esta segunda parte del proyecto, voy a instalar y configurar un servidor web que permita conexiones seguras mediante HTTPS.
Para variar un poco y probar configuraciones nuevas, montaré el servicio web utilizando nginx.

## Instalación

Antes de comenzar, necesito un servidor donde realizar los pasos necesarios. Usaré el mismo servidor que cree en la [parte 1](./Parte1.md).

![alt text](../img/image/image.png)

Ahora sí, vamos con la instalación.

1. Primero, actualizo los paquetes de ``yum``:

![alt text](../img/image/image-1.png)

2. Instalo ``nginx`` con el siguiente comando:

![alt text](../img/image/image-2.png)

3. Y arranco el servicio con este otro:

![alt text](../img/image/image-3.png)

Una vez instalado, tengo que abrir los puertos correspondientes en el ``grupo de seguridad`` de la instancia. Los grupos de seguridad funcionan como un ``firewall``: permiten o bloquean el tráfico entrante y saliente.

Hago lo siguiente:

![alt text](../img/image/image-4.png)

![alt text](../img/image/image-5.png)

![alt text](../img/image/image-6.png)

Agregando estas 2 reglas, permitimos el tráfico entrante en los puertos 80 y 443.  Ahora, si accedo a la IP pública, veo lo siguiente:

[http://13.48.58.168/](http://13.48.58.168/)

![alt text](../img/image/image-7.png)

Esto confirma que el servidor web está funcionando correctamente y que las nuevas reglas se han aplicado bien.

## Configuración

Con el servidor funcionando en el puerto 80, toca configurar un certificado autofirmado para habilitar HTTPS.

Para este apartado necesito:

1. Un dominio apuntando a la IP pública de tu instancia.
2. Puerto 80 y 443 abiertos en el grupo de seguridad.
3. Un certificado autofirmado.

Para el dominio, voy a utilizar la web [No-IP](https://my.noip.com/). Simplemente le damos a crear un nuevo `Hostname`, ponemos el nombre que queramos y la `IP` a la que debe apuntar:

![alt text](../img/image/image-8.png)

Compruebo que funcione correctamente y continuo:

[https://proyecto9bastionado.ddns.net/](https://proyecto9bastionado.ddns.net/)

![alt text](../img/image/igual.gif)

Los puertos 80 y 443 ya están abiertos, no hace falta tocar nada más en ese aspecto.

Para generar el certificado autofirmado, usaré ``certbot``, una herramienta que simplifica bastante el proceso. Sigo los siguientes pasos:

### 1. Instalo `certbot` y las dependecias necesarias para `nginx`:

![alt text](../img/image/image-9.png)

### 2. Ajusto el dominio en la configuración de `nginx`:

![alt text](../img/image/image-11.png)

### 3. Ejecuto la herramienta especificando el servidor que vamos a utilizar:

![alt text](../img/image/image-10.png)

### 4. Por último, compruebo como la configuración se ha creado de manera automática y la conexión segura está funcionando:

![alt text](../img/image/image-12.png)

![alt text](../img/image/image-13.png)

## Comparación

Para la parte de la comprobación, lo voy a hacer con la web de [nintendo.es](https://www.nintendo.com/es-es/):

![alt text](../img/image/image-14.png)

![alt text](../img/image/image-15.png)

Información a destacar es:

|                 | Personal                      | Nintendo                                   |
| --------------- | ----------------------------- | ------------------------------------------ |
| **Alg. cifra.** | Firma X9.62 ECDSA con SHA-384 | PKCS #1 SHA-256 con cifrado RSA            |
| **CN**          | E5                            | DigiCert Global G2 TLS RSA SHA256 2020 CA1 |
| **O**           | Let's Encrypt                 | DigiCert Inc                               |
| **C**           | US                            | US                                         |
| **Validez**     | 90 días                       | 386 días                                   |