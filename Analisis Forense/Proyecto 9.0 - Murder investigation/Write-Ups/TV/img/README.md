## Dispositivos bluetooth

Podemos ver dos dispositivos en la televisión, el primero es un amazon echo y el segundo es una pulsera xiaomi.

![](img/img1.png)

**Dispositivo Amazon Echo**

![](img/img2.png)

**Pulsera bluetooth Xiaomi**

![](img/img3.png)


## Encendido del sistema

El archivo `/var/log/wtmp`, encargado de registrar sesiones de inicio y apagado del sistema, muestra una modificación correspondiente al **17 de julio de 2017 a las 06:02:11 (UTC)**. 

![](img/img4.png)

## Película

Se puede ver que en los logs de kodi que terminó de ver una película a las 15:19:37 del 17 de julio

![](img/img5.png)

Hora en UTC         → 06:19:37  
Zona horaria Japón → UTC+9  
Hora local real     → 15:19:37 del 17 de julio

![](img/img6.png)

| Evento              | Hora registrada (log de Kodi) | Hora del sistema (modificación de archivo) |
| ------------------- | ----------------------------- | ------------------------------------------ |
| Fin de reproducción | 02:19:37                      | 06:19:37 (hora real confirmada por FTK)    |
