# Escenario

![alt text](image.png)

[Ejercicio 2 David](https://cuddly-disco-plg1r3k.pages.github.io/resources/ejercicios-prueba2-vlan/2.html)

# Aclaración

Le pregunté a David por una duda del escenario que puso y me dijo que había que ponerlo así,  un router-on-stick

# Subneting

>Hay que tener en cuenta la metodología de David, ya que se corrige automáticamente el ejercicio.

RED inicial: 192.168.100.0/21

- VLAN 40 -> 256 equipos
- VLAN 50 -> 128 equipos
- VLAN 30 -> 64  equipos

---

\(2^n -2 \geq 256\) -;- \(n=9\) -;- \(32-9=23\) -;- \(255.255.254.0\)

192.168.100.0/23

| BroadCast | 1º equipo | ultimo equipo |
|-|-|-|
| 192.168.101.255 | 192.168.100.1 | 192.168.101.254 |

192.168.102.0/23

\(2^n -2 \geq 128\) -;- \(n=8\) -;- \(32-8=24\) -;- \(255.255.255.0\)

192.168.102.0/24

| BroadCast | 1º equipo | ultimo equipo |
|-|-|-|
| 192.168.102.255 | 192.168.102.1 | 192.168.102.254 |

192.168.103.0/24

\(2^n -2 \geq 64\) -;- \(n=7\) -;- \(32-=25\) -;- \(255.255.255.128\)

192.168.103.0/25

| BroadCast | 1º equipo | ultimo equipo |
|-|-|-|
| 192.168.103.127 | 192.168.103.1 | 192.168.103.126 |

---

# Configurar router

En el router tenemos que asignarle las IPs en las subinterfaces y crear las pools de IPs para el DHCP.

Primero que nada, debemos "encender" la interfaz del router(no sé que hace este comando pero así se quita el triángulo rojo de la interfaz):

![alt text](image-1.png)

```
enable
configure terminal
int Gig0/0/0
no shut
```

## Asignar IPs

Ahora, teniendo "encendida" la interfaz, debemos asignarle 3 IPs diferentes mediante sub interfaces. Ponemos lo siguiente:

### IP VLAN 40

```
int Gig0/0/0.40
encapsulation dot1Q 40
ip address 192.168.100.1 255.255.254.0
```

### IP VLAN 50

```
int Gig0/0/0.50
encapsulation dot1Q 50
ip address 192.168.102.1 255.255.255.0
```

### IP VLAN 30

```
int Gig0/0/0.30
encapsulation dot1Q 30
ip address 192.168.103.1 255.255.255.128
```

Para ver las IPs de las interfaces podemos poner:

```
show ip interface brief
```

![alt text](image-2.png)

## Crear pools de IPs

Una **pool** es un espacio no físico que tienen los routers donde guardan rangos de IPs para, posteriormente, asignarlas por DHCP

Tenemos que crear 3 pools, una para cada VLAN:

### POOL VLAN 40

```
ip dhcp pool VLAN40
network 192.168.100.0 255.255.254.0
default-router 192.168.100.1
dns-server 8.8.8.8
```

### POOL VLAN 50

```
ip dhcp pool VLAN50
network 192.168.102.0 255.255.255.0
default-router 192.168.102.1
dns-server 8.8.8.8
```

### POOL VLAN 30

```
ip dhcp pool VLAN30
network 192.168.103.0 255.255.255.128
default-router 192.168.103.1
dns-server 8.8.8.8
```
---

Por último si queremos ver las pools creadas, debemos poner:

```
show ip dhcp pool
```

![alt text](image-4.png)

Y ya habríamos acabado la configuración del router, pasemos al switch central.

# Configuración switch central

En el switch central tenemos que crear las VLANs, aún no las hemos creado, y poner cada interfaz como **port trunk**.

## Crear VLANs

Para crear las VLANs tenemos que entrar a la ternimal de switch y poner:

```
enable
configure terminal
vlan 40
name VLAN40
vlan 50
name VLAN50
vlan 30
name VLAN30
```

Podemos ver las VLANs con *show vlan*

Y, antes de ver las VLANs, vamos a poner las interfaces en modo trunk.

## Interfaces modo trunk

En este switch central, debemos poner todas las interfaces en modo trunk. Empecemos pues:

```
int Fa0/1
switchport mode trunk

int Fa0/2
switchport mode trunk

int Fa0/3
switchport mode trunk

int Fa0/4
switchport mode trunk
```

Por último antes de pasar a los switch *de acceso*, veamos las vlans con:

```
show vlan
```

![alt text](image-5.png)

# Configuración switchs de acceso

En estos switchs tenemos que volver a crear las vlans, poner algunas interfaces en modo trunk y otras en acceso.

### Crear VLANs

Ahora no tenemos porque crear 3 VLANs en cada switch, es decir:

![alt text](image-6.png)

Como podemos ver, cada switch está conectado a 2 equipos de dos redes diferentes, por lo que solo debemos crear 2 VLANs por switch, y lo haré siguiendo esta metodología:

Cuadrado lila -> VLAN40

Cuadrado celeste -> VLAN50

Cuadrado rojo -> VLAN30

Entonces, vamos a dividir los comandos por cada switch.

#### SWITCH izquierdo

```
enable
configure terminal
vlan 40
name VLAN40
vlan 50
name VLAN50
```

#### SWITCH central

```
enable
configure terminal
vlan 40
name VLAN40
vlan 30
name VLAN30
```

#### SWITCH derecho

```
enable
configure terminal
vlan 50
name VLAN50
vlan 30
name VLAN30
```

### Interfaces en modo trunk

Igual que antes, todas las interfaces que den al switch central en modo trunk:

```
int Fa0/3
switchport mode trunk
```
> Por como yo he creado el escenario, todas las interfaces son Fa0/3, me ahorro poner aquí el resto.

Y por último,

### Interfaces en modo access

Paso final de la configuración, poner las interfaces de los switchs en modo acceso y pasar a traves de ellos la VLAN necesario.


#### Ejemplo configuración

```
int Fa0/1
switchport mode access 
switchport access Vlan 40

int Fa0/2
switchport mode access 
switchport access Vlan 50
```
> Vamos ya casi por las 300 líneas de tuto, el resto de Switchs son iguales pero cambiando la interfaz y la vlan

# Por últimisimo

Poner los PC en DHCP. Se hace de la siguiente manera:

![alt text](image-7.png)

![alt text](image-8.png)

![alt text](image-9.png)

![alt text](image-10.png)

En esta última foto vemos como se asigna una IP automáticamente. Y para poder comprobar los resultados, tenemos que esperar un poco a que todo se enrute correctamente. Cuando creamos que ha paso el tiempo suficiente le damos a la **P** y empezamos a enviar paquetes de un PC a otros, todos deberían dar ping.

![alt text](image-11.png)

Si da error, no has esperado lo suficiente, y si crees que ha pasado mucho tiempo tienes algo mal xD.

# Solución a errores

No os mentiré, yo soy más de Mikrotick que de Cisco, borrar el Router y el Switch y empezar de 0 xD.
