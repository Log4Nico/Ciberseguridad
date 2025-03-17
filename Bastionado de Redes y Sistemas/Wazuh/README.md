# Guía de Instalación de Wazuh

![alt text](./img/1.png)
> Empezamos con un update y la instalación de curl.

`sudo apt update && sudo apt install curl`

![alt text](./img/2.png)
> Nos descargamos el script de instalación del wazuh.

`curl -sO https://packages.wazuh.com/4.11/wazuh-install.sh`

![alt text](./img/3.png)
> Ejecutamos el script de manera automática e ignorando los requisitos mínimos.

`sudo bash ./wazuh-install.sh -a -i`

![alt text](./img/4.png)
> Esperamos a que se termine de instalar el script(10 minutos).

![alt text](./img/5.png)
> Guardamos la contraseña.

![alt text](./img/6.png)
> Entramos a https://{ip_server}:443 

![alt text](./img/8.png)
> Añadimos un nuevo agente.

![alt text](./img/7.png)
![alt text](./img/9.png)
> Especificamos los datos necesarios y ejecutamos los 2 bloques de comanodos en el cliente.

![alt text](./img/10.png)
> Reiniciamos el wazuh en el servidor.

`sudo systemctl restart wazuh-manager.service`

![alt text](./img/11.png)
> Veremos un cliente activo.

![alt text](./img/13.png)
> Le damos clic.

![alt text](./img/14.png)
> Y pulsamos en Configuration Assessment.

![alt text](./img/15.png)
> Y aquí empezamos a bastionar los servicios.