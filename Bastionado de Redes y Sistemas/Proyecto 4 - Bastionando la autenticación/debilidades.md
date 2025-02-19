# Introducción

Este documento recoge las principales vulnerabilidades, tipos de ataque y sus respectivas estrategias de mitigación de los tipos de credenciales mas utilidados.

## Digitales

### Certificados digitales

- **Vulnerabilidades**: Un atacante puede crear un certificado falso para hacerse pasar por un sitio web seguro, lo que puede perder la confianza de los usuarios. Las claves privadas almacenadas en servidores inseguros también son un riesgo, ya que pueden ser robadas para acceder a información cifrada.

- **Tipos de ataque**: El uso de certificados falsificados suele darse a través de phishing, mientras que el robo de claves privadas puede ser mediante malware o accesos no autorizados a servidores.

- **Mitigación**: Implementar una PKI confiable con control sobre la emisión de certificados y monitorear su uso. Para proteger las claves privadas, deben almacenarse en dispositivos seguros como módulos HSM o TPM.

### Perfiles de redes sociales

- **Vulnerabilidades**: Las cuentas pueden ser robadas mediante phishing o por unas malas configuraciones de privacidad que comprometa información sensible.

- **Tipos de ataque**: Los atacantes usan correos electrónicos o mensajes fraudulentos para engañar a los usuarios y obtener sus credenciales. También pueden realizar ingeniería social para atacar malasm coinfigraciones.

- **Mitigación**: Activar la autenticación multifactor para proteger las cuentas, establecer políticas estrictas de privacidad y limitar la información compartida.

### Blockchain

- **Vulnerabilidades**: Las claves privadas de wallets pueden ser robadas, permitiendo a los atacantes manipular transacciones. Las blockchains mal configuradas también son sensibñes a ataques de doble gasto.

- **Tipos de ataque**: Phishing o malware son las más comunes para comprometer wallets, mientras que el doble gasto ocurre cuando un atacante logra revertir transacciones confirmadas.

- **Mitigación**: Usar wallets con autenticación robusta (hardware wallets) y configurar blockchains con algoritmos de consenso seguros como Proof of Stake (PoS).

### Microcredenciales

- **Vulnerabilidades**: Las microcredenciales pueden ser usadas para difundir información maliciosa o acceder a datos sensibles compartidos por los usuarios.

- **Tipos de ataque**: Los atacantes pueden realizar suplantaciones de identidad o aprovechar configuraciones incorrectas para acceder a información sensible.

- **Mitigación**: Configurar permisos de acceso adecuados y realizar auditorías periódicas de seguridad.

## Fisicas

### Targeta de identificación

- **Vulnerabilidades**: Las tarjetas pueden ser falsificadas o robadas, lo que permite su uso indebido para acceder a instalaciones restringidas.

- **Tipos de ataque**: Las falsificaciones suelen ocurrir cuando las tarjetas no tienen características de seguridad, mientras que el robo puede facilitar accesos no autorizados.

- **Mitigación**: Usar hologramas y chips inteligentes para prevenir falsificaciones y establecer políticas para reportar y desactivar tarjetas extraviadas rápidamente.

### Diplomas y Certificados físicos

- **Vulnerabilidades**: Los diplomas y certificados físicos pueden ser falsificados, permitiendo a los atacantes obtener beneficios no autorizados.

- **Tipos de ataque**: La falsificación de estos documentos facilita accesos indebidos a trabajos o becas.

- **Mitigación**: Implementar sistemas de verificación digital vinculados a los documentos físicos y emplear sellos de agua o firmas digitales.

### Targetas inteligentes

- **Vulnerabilidades**: Las tarjetas inteligentes pueden ser manipuladas si el chip no cuenta con protección adecuada. Además, si no están cifradas, pueden ser atacados por lectura no autorizada.

- **Tipos de ataque**: Lectura o clonación de datos del chip mediante dispositivos especializados, ataques de fuerza bruta para descifrar datos, o ingeniería inversa para explotar vulnerabilidades en el hardware.

- **Mitigación**: Usar cifrado avanzado en los datos almacenados en las tarjetas, implementar mecanismos de autenticación en el chip, y auditar regularmente las tarjetas para garantizar su integridad.

### Targetas de acceso NFC

- **Vulnerabilidades**: Los datos de las tarjetas NFC pueden ser clonados.

- **Tipos de ataque**: Los atacantes pueden clonar tarjetas NFC para obtener accesos no autorizados.

- **Mitigación**: Usar tarjetas con cifrado avanzado como MIFARE DESFire y combinar su uso con autenticación biométrica.


---

## Autenticación

### Códigos QR

- **Vulnerabilidades**: Los códigos QR son susceptibles a manipulación, como la creación de códigos QR maliciosos que redirigen a sitios web fraudulentos o descargan malware. También carecen de mecanismos de verificación visual, lo que dificulta distinguir entre un código QR legítimo y uno falso.

- **Tipos de ataque**: Los atacantes pueden emplear ataques de phishing mediante QR, conocidos como quishing, o superponer códigos QR maliciosos sobre los legítimos. En algunos casos, también pueden interceptar y modificar datos en tránsito si el QR es utilizado para transmitir información.

- **Mitigación**: Verificar los enlaces a los que apunta el código QR antes de interactuar con ellos, implementar firmas digitales en los códigos QR para autenticar su origen, y educar a los usuarios para que sean cautelosos con códigos QR en ubicaciones públicas no confiables.

### Autenticación de dos factores (2FA)

- **Vulnerabilidades**: El 2FA puede ser comprometido si uno de los factores es débil, como contraseñas fácilmente adivinables, o si el canal de comunicación es inseguro, como mensajes SMS que pueden ser interceptados.

- **Tipos de ataque**: Los ataques comunes incluyen intercepción de SMS mediante técnicas como SIM swapping o malware en dispositivos móviles. Además, el phishing puede engañar a los usuarios para proporcionar tanto su contraseña como el código 2FA.

- **Mitigación**: Utilizar aplicaciones de autenticación como Google Authenticator en lugar de SMS, emplear métodos de 2FA más robustos como claves físicas, y combinar el 2FA con monitoreo de acceso sospechoso para detectar anomalías.

### Biometría

- **Vulnerabilidades**: Los sistemas biométricos son vulnerables a la falsificación de datos biométricos, como huellas dactilares falsas o patrones faciales replicados. Además, si los datos biométricos son robados, no pueden ser reemplazados como una contraseña.

- **Tipos de ataque**: Ataques de falsificación biométrica (como huellas impresas en silicona) y ataques de replay donde un atacante reutiliza datos biométricos capturados anteriormente. También puede haber abuso interno si el sistema no está correctamente segmentado.

- **Mitigación**: Usar hardware seguro para almacenar datos biométricos (por ejemplo, módulos TPM), implementar detección de vida (liveness detection) en los sistemas biométricos, y asegurarse de que los datos biométricos sean cifrados en tránsito y en reposo.

### One Time Password (OTP) SMS

- **Vulnerabilidades**: Los OTP basados en SMS son vulnerables a intercepción debido a debilidades en las redes de telecomunicaciones (como SS7). También pueden ser expuestos si el dispositivo móvil está comprometido.

- **Tipos de ataque**: Técnicas como el SIM swapping, malware móvil o phishing pueden ser empleadas para obtener los códigos OTP enviados por SMS.

- **Mitigación**: Cambiar SMS por aplicaciones de autenticación, implementar límites en los intentos de ingreso, y monitorear patrones anómalos en los accesos para detectar posibles compromisos.

## Dominio y Genéricas

### Credenciales de dominio

- **Vulnerabilidades**: Las credenciales de dominio suelen tener acceso a múltiples recursos críticos en un entorno empresarial. Si no se gestionan adecuadamente, como mediante contraseñas débiles o políticas laxas, pueden ser un objetivo prioritario para los atacantes.

- **Tipos de ataque**: Ataques de fuerza bruta para adivinar credenciales, técnicas como Pass-the-Hash para reutilizar hashes de contraseñas robadas, y el uso de herramientas como Mimikatz para extraer credenciales directamente de la memoria.

- **Mitigación**: Implementar contraseñas robustas, políticas de cambio periódico de contraseñas, y activar autenticación multifactor (MFA) para credenciales de dominio. Además, segmentar privilegios y usar detección de amenazas para identificar intentos no autorizados.

### Credenciales genéricas

- **Vulnerabilidades**: Las credenciales genéricas suelen ser compartidas entre múltiples usuarios, lo que dificulta el rastreo de responsabilidades y aumenta el riesgo de que sean reutilizadas o filtradas.

- **Tipos de ataque**: Ataques de fuerza bruta o técnicas de credential stuffing donde atacantes prueban combinaciones comunes de credenciales. Además, si las credenciales se filtran, pueden ser reutilizadas en otros sistemas.

- **Mitigación**: Prohibir el uso de credenciales genéricas, asignar credenciales únicas a cada usuario y emplear herramientas de gestión de accesos para monitorizar su uso.

## Aplicaciones

### Tokens de acceso

- **Vulnerabilidades**: Los tokens de acceso, si no están configurados correctamente, pueden ser capturados y reutilizados por atacantes. También pueden no tener expiración o permisos excesivos, aumentando el riesgo de abuso.

- **Tipos de ataque**: Robo de tokens mediante la intercepción de tráfico no cifrado, almacenamiento inseguro en dispositivos cliente, o ataques de Cross-Site Scripting (XSS) para extraerlos del navegador.

- **Mitigación**: Configurar expiración y alcance limitados para los tokens, asegurar la comunicación con HTTPS, y almacenar tokens de manera segura utilizando mecanismos como almacenamiento cifrado en dispositivos.

### API keys

- **Vulnerabilidades**: Las API keys suelen ser expuestas en repositorios públicos (por ejemplo, en GitHub) o en aplicaciones cliente, lo que facilita su uso no autorizado.

- **Tipos de ataque**: Los atacantes pueden emplear ataques de abuso de API, explotando las API keys para realizar solicitudes masivas o acceder a datos sensibles. También pueden aprovechar permisos mal configurados para escalar privilegios.

- **Mitigación**: Rotar las API keys regularmente, usar restricciones de origen para limitar el uso de las claves a dominios específicos, y habilitar monitoreo para detectar actividades sospechosas.

### Certificados digitales

- **Vulnerabilidades**: Si los certificados digitales no son gestionados correctamente, como no renovarlos a tiempo o permitir el uso de algoritmos débiles, pueden ser comprometidos.

- **Tipos de ataque**: Los atacantes pueden emplear ataques de intermediario (MITM) al aprovechar certificados vencidos o robados, o incluso intentar falsificar certificados si los controles no son adecuados.

- **Mitigación**: Usar autoridades certificadoras confiables, implementar monitoreo automatizado para la expiración de certificados, y emplear estándares modernos de cifrado (como TLS 1.3) para garantizar la seguridad.
