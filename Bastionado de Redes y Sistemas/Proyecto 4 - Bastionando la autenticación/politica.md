# Políticas

## 1. Contraseñas y frases de paso

### 1.1. Longitud y complejidad de contraseñas

Las contraseñas deben ser lo suficientemente largas y difíciles para evitar que alguien las adivine fácilmente. Por ejemplo:

- Tener al menos 12 caracteres.
- Incluir mayúsculas, minúsculas, números y símbolos especiales (como @, # o &).

*Ejemplo:* Una buena contraseña sería: `C0ntr@s3ñA!2025`

### 1.2. No reciclar contraseñas antiguas

Para tener todo más seguro, no puedes usar las últimas 5 contraseñas que ya hayas usado.

*Ejemplo:* Si tu contraseña anterior era `Abc12345!`, no podrás volver a usarla hasta que cambies 5 veces.

### 1.3. Revisar contraseñas expuestas

Usaremos herramientas para asegurarnos de que tus contraseñas no estén en listas de filtraciones de internet.

*Ejemplo:* Si una herramienta detecta que tu contraseña `M1C0ntr@s3ñA` aparece en una filtración, deberás cambiarla de inmediato.

### 1.4. Guardar contraseñas de forma segura

Las contraseñas se almacenarán encriptadas utilizando tecnologías como bcrypt o Argon2. Esto implica que si alguien roba la información, no podrá entenderlas fácilmente.

*Ejemplo:* Aunque alguien consiga acceso al servidor, no podrá ver tu contraseña real, solo su versión cifrada.

## 2. Certificados digitales y tarjetas inteligentes

### 2.1. Certificados fuertes

Los certificados digitales que usamos deben ser seguros. Por ejemplo, con RSA de 3072 bits.

*Ejemplo:* Un certificado digital es lo que asegura que eres quien dices ser.

### 2.2. Caducidad de certificados

Un certificado solo durará 1 año. Cuando esté a punto de vencer, tendrás que renovarlo.

*Ejemplo:* Si tu certificado expira el 31 de diciembre, deberás renovarlo antes de esa fecha para seguir entrando al sistema.

### 2.3. Gestión centralizada (PKI)

Todos los certificados serán gestionados desde un sistema centralizado para que nadie pueda usarlos de forma ilegal.

*Ejemplo:* Si alguien trata de usar un certificado anulado, el sistema centralizado lo detendrá de forma automática.

### 2.4. Proteger las tarjetas inteligentes

Si utilizas una tarjeta inteligente, ponla en un lugar seguro y no la dejes abandonada.

*Ejemplo:* Guarda tu tarjeta en un bolsillo seguro o en un estuche, no la dejes sobre tu mesa.

## 3. Tokens y códigos de un solo uso (OTP)

### 3.1. Tiempo de vida de los OTP

Los códigos de un solo uso (OTP) deben expirar en 30 segundos. Así evitamos que alguien los use después de habértelos robado.

*Ejemplo:* Si obtienes un OTP por SMS, debes utilizarlo pronto antes de que se agote el tiempo.

### 3.2. Protege los dispositivos que generan OTP

Los dispositivos o apps que generan estos códigos deben estar protegidos con un PIN o biometría.

*Ejemplo:* Configura tu aplicación de autenticación (como Google Authenticator) para que pida tu huella antes de mostrar el código.

### 3.3. No reutilizar OTP

Un código usado ya no sirve, aunque alguien intente usarlo de nuevo.

*Ejemplo:* Si intentas iniciar sesión dos veces con el mismo OTP, el sistema lo rechazará.

### 3.4. Enseñar a usar tokens

Se llevará a cabo una formación para que todos aprendan a utilizar sus tokens y qué hacer si los pierden.

*Ejemplo:* Si pierdes tu token físico, debes reportarlo al soporte técnico inmediatamente para que lo desactiven.

## 4. Biometría

### 4.1. Validar los dispositivos biométricos

Los escáneres de huellas o reconocimiento facial deben ser seguros y seguir normas internacionales.

*Ejemplo:* Asegúrate de que el lector de huellas de tu portátil sea compatible con los estándares ISO.

### 4.2. Cifrado de datos biométricos

Tu huella digital o rostro será almacenado cifrado para proteger tu privacidad.

*Ejemplo:* Aunque alguien acceda a la base de datos, no podrá ver tus datos biométricos reales.

### 4.3. Pruebas contra fraudes

Haremos pruebas para prevenir que alguien use una foto, máscara o video para hacerse pasar por ti.

*Ejemplo:* Probaremos si el sistema puede detectar una foto de tu rostro en lugar de tu cara real.

### 4.4. Alternativas a la biometría

Habrá otras opciones si no puedes usar biometría, como tokens o códigos.

*Ejemplo:* Si tienes problemas con el lector de huellas, podrás usar un código enviado a tu móvil.

## 5. Seguridad de redes sociales

### 5.1. Privacidad y configuración

Las cuentas de redes sociales deben tener configuraciones estrictas de privacidad para proteger la información sensible.

*Ejemplo:* Configura tu perfil para que solo personas de confianza puedan ver tus publicaciones.

### 5.2. Autenticación robusta

Se debe habilitar la autenticación multifactor (MFA) para proteger las cuentas de accesos no autorizados.

*Ejemplo:* Vincula tu cuenta de redes sociales a una aplicación de autenticación para mayor seguridad.

### 5.3. Capacitación contra phishing

Es necesario entrenar a los usuarios para identificar mensajes o correos falsos que intenten robar credenciales.

*Ejemplo:* Si recibes un enlace sospechoso, verifica su origen antes de hacer clic.

