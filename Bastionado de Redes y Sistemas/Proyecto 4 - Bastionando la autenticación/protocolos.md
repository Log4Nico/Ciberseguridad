# Protocolos de atenticación en la empresa

En este apartado definiremos protocolos para cada tipo de acceso que nos piden. Indicaremos los pasos necesarios y las infraestructuras o softwares que utilizaremos. 


## Contraseñas y frases de paso

### - Pasos
 - Este tipo de autenticación se podrá utilizar para accesos a portales de la empresa no tan importantes o lugares de acceso que no sean tan relevantes. 

 - Los empleados accederán a dichos portales con su usuario único. Posteriormente introducirán su contraseña. 

 - Esta contraseña deberá ser segura y robusta. Deberá tener al menso 10 caracteres y no debe tener información personal. A parte deberá contener al menos un mayúscula, una minúscula, un número y un símbolo. Estas tendrán que renovarse trimestralmente.

 - Si las credenciales concuerdan con la base de datos se le dará acceso al empleado. 
---
 - Del mismo modo si quiere acceder a un lugar que no es relevante pero tendrá acceso a través de una frase de paso. En la puerta donde se acceda al lugar puede haber un reconocimiento de voz o un panel para escribir la frase que se ha de memorizar para poder entrar.

### - Software o infraestructura

 - Active Directory donde estarán registrados todos los usuarios del dominio de la empresa con sus respectivas contraseñas.
 - Herramientas que permitan la gestión de contraseñas como Kaspersky o Bitwarden.

## Certificados digitales y tarjetas inteligentes

### - Pasos 
 - Para realizar cambios en la información de las cuentas de los usuarios los empleados deberán hacer uso del certificado digital que le ha dado la empresa para realizar dichas acciones. 
 - Si por ejemplo quieres cambiar el correo del perfil de la empresa el portal te pedirá que introduzcas el certificado digital. 
 - El sistema comprueba el certificado y si ve que es válido permitirá hacer el cambio. 

---

 - Para los empleados que tengan acceso a lugares restringidos la empresa les entregará. 
 - En la puerta habrá un lector de tarjetas y el empleado deberá acercarla para validarla.

 - Si los permisos son los correctos el lector validará la tarjeta y permitirá el acceso al lugar.
 
### - Software o infraestructura

 - Podría usarse softwares de validación de certificados digitales como Redtrust.
 - En infraestructura hará falta lectores de tarjetas inteligentes en las puertas de los accesos restringidos. 

## Tokens, OTPs, etc

### - Pasos 

 - Lo usaremos para poder acceder a la cuenta de correo corporativo de la empresa, la cuál para acceder te pedirá un código OTP.
 - Cuando el empleado ingrese su usuario y contraseña para acceder al correo, el sistema primero verifica que las credenciales son correctas y si es así, solicita un segundo factor.
 - Este segundo factor en un código OTP que le llegará al móvil al empleado mediante una aplicación que proporcionará la empresa.
 - El empleado ingresará el código que le sale en la aplicación.
 - El sistema verificará su validez y si es correcta brindará acceso a la cuenta de correo. 

### - Software o infraestructura

- Haremos uso de aplicaciones de doble factor como Google Authenticator o Microsoft Authenticator



## Características biométricas

### - Pasos 

 - Para el acceso a los dispositivos de la empresa (móviles y ordenadores), los empleados tendrán que validarse con autenticación biométrica.
 - Existirán dos tipos de biometría dependiendo del dispositivo:
    - Huella dactilar: pondrán el dedo en el lector de huellas dactilares.
    - Reconociemiento facial: la cámara captura la cara de la persona. 
 - Para poder acceder habrá que realizar una de estas dos validaciones.
 - El sistema comprobará los resultados de las características biométricas con la base de datos donde tenga almacenada la empresa dicha información.
 - Si coincide se permitirá el acceso al dispositivo.

### - Software o infraestructura

- Harán falta lectores biométricos tanto de huellas como de reconocimiento facial. 
