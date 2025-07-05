# Proyecto 3: Unfaithful Employee - Investigación del incidente

Este documento consta de la parte 1 del proyecto que consiste en la investigación de la imagen de disco y la respuesta a las preguntas planteadas.

---

## 1. Verificar la integridad de la imagen del disco a través de CMD o PowerShell, comparando los hashes proporcionados. ¿Coinciden los tres hashes?

Para comprobar la integridad del disco, hemos hecho uso de las herramientas por consola de Windows, y hemos sacado los siguientes hashes:

- **md5**:

| **Hash esperado**                    | **Hash conseguido**                  |
| ------------------------------------ | ------------------------------------ |
| **dfdfba2231e3fa409676b1b737474208** | **dfdfba2231e3fa409676b1b737474288** |

- **sha1**:

| **Hash esperado**                            | **Hash conseguido**                          |
| -------------------------------------------- | -------------------------------------------- |
| **f476a81089a10f9d5393aa8c2f8bbccdb87f7d3c** | **f476a81089a10f9d5393aa8c2f8bbccdb87f7d3c** |

- **sha256**:

| **Hash esperado**                            | **Hash conseguido**                                                  |
| -------------------------------------------- | -------------------------------------------------------------------- |
| **f476a81089a10f9d5393aa8c2f8bbccdb87f7d3c** | **66d6ee7a61ea7a986e8f6bb54b9986f79d95b5a0278bef86678ed42ace320d9b** |

Comprobamos que los hashes MD5 y SHA256 no coinciden con los proporcionados en el documento.

---

## 2. Confirmar la existencia de un usuario correspondiente a Richard en el equipo y determinar cuándo fue su último inicio de sesión

Para comprobar la existencia del usuario Richard, debemos extraer el archivo _SAM_ del directorio `C://windows/system32/config` y importarlo a la herramienta WRR.

![Usuario Richard](./img/Hallazgos/Hallazgo%201.png)

Vemos que el único usuario de la máquina es Richard. El resto son usuarios que Windows crea por defecto, y también observamos que el último inicio de sesión es el día **22 de febrero de 2023 a las 13:55:18**.

---

## 3. Identificar el nombre del equipo y la versión del Sistema Operativo utilizado

Para identificar el nombre y la versión del equipo, debemos extraer los archivos _software_ y _system_ del directorio `C://windows/system32/config`.

![Versión de Windows](./img/Hallazgos/Hallazgo%202.png)

Aquí podemos comprobar la versión de Windows 10 que tiene instalado el disco: **Pro Education N**.

![Nombre del equipo](./img/Hallazgos/Hallazgo%203.png)

Y aquí el nombre del equipo: **LADRONERA**.

---

## 4. Investigar si se introdujo algún dispositivo USB en el equipo, a pesar de las políticas de la empresa contra su uso por parte de Richard. En caso afirmativo, especificar los detalles del dispositivo USB y el momento de su conexión

Para identificar los dispositivos USB del equipo, debemos extraer el archivo _system_ del directorio `C://windows/system32/config`.

![Dispositivo USB 1](./img/Hallazgos/Hallazgo%204.png)
![Dispositivo USB 2](./img/Hallazgos/Hallazgo%205.png)
![Dispositivo USB 3](./img/Hallazgos/Hallazgo%206.png)

En esta serie de imágenes, podemos comprobar que se introdujo un dispositivo USB con el siguiente id: **{4D36E967-E325-11CE-BFC1-08002BE10318}**, y cuya última conexión fue el **22 de febrero de 2023 a las 00:27:42**.

---

## 5. Dado el interés conocido de Richard por el fútbol y la música rock y heavy, investigar su actividad en línea relacionada con estos intereses. Además, verificar si ha visualizado contenido en línea que pueda justificar un despido procedente, como la visualización de una película online. Documentar cualquier hallazgo relevante

![Historial de navegación](./img/Hallazgos/Hallazgo%207.png)

Hemos encontrado esta URL en el historial de navegación que proviene del video titulado: **El truco con nata y monedas que le vuela la cabeza a Jennifer Aniston**.

![Cuevana](./img/Hallazgos/Hallazgo%208.png)

Accedió a CUEVANAHD para ver la película _Trabajo basura_.

![Amazon](./img/Hallazgos/Hallazgo%209.png)

Entró en Amazon y buscó dispositivos pendrive.

![Búsqueda de fútbol](./img/Hallazgos/Hallazgo%2010.png)

Hizo búsquedas sobre _Equipo de futbol_ en internet.

![Historial Firefox](./img/Hallazgos/Hallazgo%2011.png)

Si exportamos el archivo _places.sqlite_ del directorio `C://Users/Richard/AppData/Roaming/Mozilla/Firefox/Profiles/mt13hmmn.default-release`, veremos las páginas que ha visitado en Firefox.

![Historial Firefox 1](./img/Hallazgos/Hallazgo%2012.png)
![Historial Firefox 2](./img/Hallazgos/Hallazgo%2013.png)
![Historial Firefox 3](./img/Hallazgos/Hallazgo%2014.png)
![Historial Firefox 4](./img/Hallazgos/Hallazgo%2015.png)
![Historial Firefox 5](./img/Hallazgos/Hallazgo%2016.png)
![Historial Firefox 6](./img/Hallazgos/Hallazgo%2017.png)

Por último, podemos ver todo el historial del navegador _Opera_, en el cual hace numerosas búsquedas relacionadas con fútbol y videos de YouTube.

---

## 6. Determinar si, tras su salida de la empresa, Richard tenía planes de visitar otro lugar y, de ser así, cómo planeaba llegar allí

Como vemos en la imagen:

![Búsqueda de vuelos](./img/Hallazgos/Hallazgo%2015.png)

Apreciamos que _Richard_ buscó vuelos baratos a ciudades europeas y hoteles en _Las Palmas de Gran Canaria_.

---

## 7. Comprobar si existe algún navegador web, aparte de los proporcionados por Microsoft, configurado para ejecutarse al iniciar sesión Richard

![Navegadores al inicio](./img/Hallazgos/Hallazgo%2018.png)

Si importamos el archivo **NTUSER.DAT** en _regedit_, vemos que los navegadores que se inician al arrancar son **Edge** y **Opera**.

---

## 8. Buscar evidencia de que Richard haya asistido a competidores o terceros mediante la exfiltración de datos por correo electrónico

Tras exportar la carpeta `C://Users/Richard/AppData/Roaming/Thunderbird/Profiles/tvtlv94f.default-release/` e importar el archivo _ImapMail/imap.gmail.com/INBOX_ en el programa **Mail Viewer**, encontramos los siguientes correos relevantes:

![Correo 1](./img/Hallazgos/Hallazgo%2019.png)
![Correo 2](./img/Hallazgos/Hallazgo%2020.png)
![Correo 3](./img/Hallazgos/Hallazgo%2021.png)
![Correo 4](./img/Hallazgos/Hallazgo%2022.png)
![Correo 5](./img/Hallazgos/Hallazgo%2023.png)
![Correo 6](./img/Hallazgos/Hallazgo%2024.png)

Apreciamos que:

- **20 de febrero de 2023**

  - **20:53**: Richard mantiene una conversación con `proba2.seguridade@gmail.com` acerca de ser contratado por estos y enviarles un _material_ a cambio de una compensación económica.

- **22 de febrero de 2023**
  - **00:59**: Richard mantiene una conversación con `proba2.seguridade@gmail.com` sobre cambiar su lugar de trabajo al día siguiente, enviarle la _muestra_ y recibir un pago.
  - **01:01**: Richard envía un mensaje a `proba2.seguridade@gmail.com` diciéndole que le envía la _muestra_.
  - **01:06**: `proba2.seguridade@gmail.com` le responde que el pago es demasiado grande (100k) y que se tendrá que hacer por bitcoin.
  - **01:40**: Richard habla con `phy.reg@gmail.com` y le dice que se ha ido de la empresa.
  - **15:06**: Richard mantiene una conversación con `proba2.seguridade@gmail.com`, le envía un enlace a _Google Drive_ con el _material_ acordado en el primer mensaje, pero que solo revelará la contraseña al depositar el dinero.
  - **15:25**: Richard habla por última vez con `phy.reg@gmail.com` para despedirse y aclara que ha dejado la empresa.
