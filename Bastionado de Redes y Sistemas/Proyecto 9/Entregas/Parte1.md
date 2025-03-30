# Parte 1 - Acceso a un servidor sin necesidad de contraseña

Para esta parte del proyecto he decidido usar el entorno **AWS** porque, sinceramente, me resulta bastante interesante trastear con él.
He dividido la entrega en dos partes para que sea más claro (y porque no sabía muy bien cómo estructurarla al principio).

Por un lado, explico cómo creé la instancia y generé el par de claves; por otro, muestro cómo me conecté al servidor usando esa clave, sin necesidad de meter la contraseña del usuario.

## Procedimiento

Vale, esta parte se puede considerar *saltebale*, pero sigue siendo importante, aquí es donde creo la instancia EC2 y genero el par de claves en formato .ppk (para usarlo con PuTTY).

Aunque no sea un gran complejo técnico, pienso que es un proceso muy importante, además, de esta forma explico de donde salen las cosas que uso depués.

![gif_procedimiento](../img/Procedimiento.gif)

## Resultado

Aquí tenemos el resultado del trabajo, uso la clave privada generada anteriormente para acceder a la instancia directamente, sin introducir ninguna contraseña.

**AWS** agiliza bastante este proceso, con unos pocos clics ya te genera la clave privada.

![gif_resultado](../img/Resultado.gif)

## Conclusión

De esta forma, aprendemos una nueva forma de iniciar sesión remota en sistemas(servidores, clientes, etc.) sin la necesidad de contraseñas, lo cual viene genial para evitar ataques de fuerza bruta o inicios de sesión no deseados, y si que es verdad que **AWS** lo hace muy fácil, manualmente es un proceso un poco más complicado.

*Escribo esto como curiosidad, se que no es necesario para la entrega.*

##### 1. Generar par de claves en tu cliente.

En nuestro cliente(linux) debemos crear el par de claves con:

``ssh-keygen -t rsa -b 4096 -C "{mi_usuario}@{mi_IP/host}"``

Esto creará un par de claves, la pública, que enviaremos al servidor, y la privada, que no debemos compartir con nadie.

##### 2. Copiar la clave pública al servidor.

Una vez generada la clave pública, tendremos que pasarsela al servidor, para ello, podemos hacerlo de manera manual(copiar y pegar) o si tenemos acceso a él(usuario y contraseña) poner el siguiente comando:

``ssh-copy-id {usurio_servidor}@{ip_servidor}``

Evidentemente, tendremos que saber la contraseña del servidor, y que el servidor permita conexiones SSH por contraseña.

##### 3. Desactivar el acceso por contraseña.

Y ahora que tenemos acceso, tendríamos que desactivar el acceso por contraseña en el servidor editando el archivo `/etc/ssh/sshd_config` y poniendo:

```
PasswordAuthentication no
PermitRootLogin no
PubkeyAuthentication yes
```