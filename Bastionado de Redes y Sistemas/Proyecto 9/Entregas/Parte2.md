# Parte 2 - Configurar certificado para permitir conexión HTTPS

En esta segunda parte del proyecto, debemos instalar y configurar un servidor web para que permita conexión segura HTTPS.
Voy a montar el servicio web con nginx para cambiar un poco y probar configuraciones nuevas.

## Instalación

Bueno, antes de instalar nada, necesito un servidor donde hacer los pasos necesarios. Haré uso del servidor instalado en la [parte 1](./Parte1.md).

![alt text](image.png)

Ahora sí, comencemos con la instalación. 

1. Actualimos los paquetes `yum`:

![alt text](image-1.png)

2. Instalamos nginx con:

![alt text](image-2.png)

3. E iniciamos el servicio con:

![alt text](image-3.png)

Una vez instaldo, tenemos que abrir los puertos del grupo de seguridad de la instancia, es un poco rollo de explicar pero los grupos de seguridad funcionan como los `firewall`, permiten o deniegan el tráfico entrante y saliente.

Hacemos lo siguiente:

![alt text](image-4.png)

![alt text](image-5.png)

![alt text](image-6.png)

Agregamos estas 2 reglas, y, si ahora intentamos entrar en la dirección IP nos sale esto:

[http://13.48.58.168/](http://13.48.58.168/)

![alt text](image-7.png)

El servidor web y las nuevas reglas están funcionado correctamente.

## Configuración

Ya tenemos el servidor lanzado y escuchando en el puerto 80, ahora toca instalar un certificado autofirmado y configurarlo para permitir la conexión segura.

Para este apartado necesitamos:

1. Un dominio apuntando a la IP pública de tu instancia.
2. Puerto 80 y 443 abiertos en el Security Group.
3. Un certificado autofirmado.

Para el dominio, voy a utilizar la web [No-IP](https://my.noip.com/). Simplemente le damos a crear un nuevo `Hostname`, ponemos el nombre que queramos y la `IP` a la que debe apuntar:

![alt text](image-8.png)

Y comprobamos que funciona y que apunta al mismo sitio.

![alt text](igual.gif)

Los puertos 80 y 443 ya están abiertos y no hay que configurarlos más.

Y para el certificado autofirmado, voy a utilizar `certbot`, una herramienta que agiliza mucho la instalación. Seguimos los siguientes pasos:

### 1. Instalamos `certbot` y las dependecias para `nginx`:

![alt text](image-9.png)

### 2. Ponemos el dominio en la configuración del `nginx`:

![alt text](image-11.png)

### 3. Ejecutamos la herramienta especificando el servidor que vamos a utilizar:

![alt text](image-10.png)

### 4. Por último, comprobamos como la configuración se ha creado de manera automática y la conexión segura está funcionando:

![alt text](image-12.png)

![alt text](image-13.png)

## Comparación

Para la parte de la comprobación, lo voy a hacer con la web de [nintendo.es](https://www.nintendo.com/es-es/):

![alt text](image-14.png)

![alt text](image-15.png)

Información a destacar es:

| Certificado | Personal                      | Nintendo                                   |
| Alg. cifra. | Firma X9.62 ECDSA con SHA-384 | PKCS #1 SHA-256 con cifrado RSA            |
| CN          | E5                            | DigiCert Global G2 TLS RSA SHA256 2020 CA1 |
| O           | Let's Encrypt                 | DigiCert Inc                               |
| C           | US                            | US                                         |
| Validez     | 90 días                       | 386 días                                   |