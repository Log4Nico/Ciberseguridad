# Análisis forense de una imagen de disco duro

# Informe Pericial

## Datos de contacto

- Autor: Nicolás Ruiz Ruiz
- Correo: nruirui214@g.educaand.es
- Fecha: 09-11-24

## Declaración de abstención y tacha

Esta sección se encuentra en el apartado `1. Declaración de abstención y tacha` del [Anexo_atj](./Anexo_atj.md).

## Juramento de promesa

Al igual que el anterior, se encuentra en el [Anexo_atj](./Anexo_atj.md) en el apartado `2. Juramento de promesa`.

## Palabras clave

**Cadena de custodia**: Proceso que asegura la integridad y autenticidad de las evidencias recolectadas.
**Hash**: es una secuencia alfanumérica única que se genera a partir de un archivo o conjunto de datos digitales.
**Análisis forense**: Metodología utilizada para examinar y evaluar evidencias en el contexto legal.
**Imagen forense**: Copia exacta de un dispositivo de almacenamiento digital utilizada para análisis forense.
**Metadatos**: Información adicional sobre archivos digitales, como fecha de creación o ubicación geográfica.

## Resumen Ejecutivo

El análisis forense del disco duro decomisado ha revelado evidencias significativas relacionadas con actividades de tráfico de drogas y otros delitos. Se han encontrado imágenes de almacenes en Mataró y Terrassa, documentos sobre la producción de cocaína y anfetaminas, listas de proveedores, y hojas de cálculo con información financiera y de contactos. Además, se han descubierto archivos relacionados con pornografía infantil. Los usuarios John e Ian parecen estar directamente implicados en estas actividades ilícitas.

## Introducción

### Antecedentes

En una entrada y registro policial en un domicilio compartido por varias personas, se localizó y decomisó un ordenador personal que, quizás, pudiera estar relacionado con un presunto delito de tráfico de sustancias estupefacientes. A raíz del decomiso, una brigada especializada de un cuerpo policial realizó la clonación del disco duro contenido en el ordenador y tramitó su imagen forense a mi laboratorio para que elaborara un informe pericial de su contenido.
Para llevar a cabo esta tarea, dispongo de una autorización del juez que instruye el caso, por la cual puedo analizar cualquier contenido local del disco duro intervenido.

### Objetivos

El propósito específico de este informe pericial es analizar el contenido de la imagen forense del disco duro decomisado para identificar y documentar cualquier información relevante para la investigación del presunto delito de tráfico de sustancias estupefacientes.

## Fuentes de información

- Imagen forense del disco duro decomisado (img_AFI_W.E01)
- Autorización judicial para el análisis del contenido del disco duro

### Adquisición de evidencias

La imagen forense del disco duro fue proporcionada por una brigada especializada del cuerpo policial. La integridad de la imagen se verificó mediante el cálculo y comparación de hashes.

## Análisis

### Herramientas utilizadas

- Autopsy 4.21.0: Para el análisis general de la imagen forense.
- MiTec Windows Register Recovery: Para el análisis del registro de Windows.
- ExifTool: Para la extracción de metadatos de imágenes.
- John the Ripper: Para el descifrado de contraseñas.

### Procesos

#### Análisis del sistema operativo

El sistema operativo instalado es Windows XP Service Pack 3, instalado el 18 de abril de 2013. Se identificaron tres usuarios principales: John, Ian y Jessy.

#### Análisis de archivos eliminados

Se identificaron 582 archivos eliminados. Entre los más relevantes se encuentran:
- Imágenes de instalaciones en Mataró [1.1][1.2] y Terrassa[1.3][1.4]
- Fotografías de personas identificadas como "Jorge" [2.1], "Kasius" [2.2][2.3] y "Maria" [2.4]
- Imágenes relacionadas con procesamiento de sustancias no especificadas [3.1][3.2][3.3]

#### Análisis de documentos y archivos fotográficos

Se encontraron varios archivos que podrían ser de interés para la investigación:

- Un documento PDF sobre taxonomía de plantas [4.1]
- Enlaces a foros de discusión sobre procesos químicos [4.2]
- Una lista de contactos comerciales [4.3]
- Un archivo comprimido protegido por contraseña con 186 imágenes de contenido no verificado [4.4][4.5]

#### Análisis de metadatos

Algunos archivos fotográficos contienen metadatos relevantes:

- Dispositivos utilizados: HP oj_g510g-m, NIKON D300, SAMSUNG GT-I8190 [5.1][5.2] [5.3]
- Una imagen contiene coordenadas geográficas: Latitud 41.53260888888889, Longitud 2.4372805555555557 [5.4]

#### Análisis de hojas de cálculo

Se identificaron tres hojas de cálculo significativas:

- Una lista de credenciales para diversos servicios [6.1]
- Un archivo con nombres de archivos de contenido no verificado [6.2]
- Una lista de contactos protegida por contraseña (contraseña: "12345") [4.3]

#### Análisis de archivos comprimidos

Se encontraron 18 archivos comprimidos, destacando uno protegido por contraseña que contiene 186 imágenes de contenido no verificado [4.4][4.5]

## Limitaciones

No pudimos acceder al contenido del archivo pedofilia.zip [4.4] debido a que la contraseña era demasiado compleja.

## Conclusiones

Hemos identificado a tres usuarios principales en el sistema: John, Ian y Jessy. Encontramos varios archivos que podrían estar relacionados con actividades ilícitas. Se encontró un archivo comprimido cifrado con contraseña con 186 archivos sin verificar. Identificamos una imagen con coordenadas GPS de las instalaciones de Mataró.

En Cádiz a 28 de Enero de 2025

Fdo:

<img src="image.png" alt="firma Victor" width="200"/>