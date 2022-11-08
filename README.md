Diseño de escenarios de simulación para el análisis de servicios de conducción remota basados en comunicaciones 5G con garantias de calidad de servicio.
=======

Para realizar este proyecto nos apoyaremos de el framework de simulación *veins*, que integra *SUMO* (herramienta de modelado de carreteras, vehículos y tráfico entre otras) y *OMNET++* (que realizará toda la parte de las comunicaciones entre los vehículos y el centro de control). Para implementar estas comunicaciones emplearemos *simu5G*, que nos modelará elementos de las redes 5G.

<br/>


# Rutas
## Autogeneración

Podemos insertar mapas personalizados a nuestras simulaciones de veins. Para ello en primer lugar debemos acudir a la página web de [OpenStreetMaps](https://www.openstreetmap.org/export) y seleccionar la zona que queremos exportar. <small>(OpenSstreetMaps cuenta con una limitación a 50000 nodos, en el caso de necesitar una zona más grande debemos utilizar [planet.osm](https://planet.osm))</small>

<br/>

A continuación utilizamos la herramienta netconvert de SUMO para transformar los datos xml del mapa descargado en un escenario que puede ser interpretado por SUMO y poder realizar simulaciones de tráfico en el.

```bash
netconvert --osm-files map.osm --output-file map.net.xml --geometry.remove --roundabouts.guess --ramps.guess --junctions.join --tls.guess-signals --tls.discard-simple --tls.join
```
La herramienta random trips nos ayuda a generar distintas rutas aleatorias en las que indicamos el número en el parámetro -e. Los vehículos que realizarán dichas rutas saldrán espaciados en el tiempo 1s.

```bash
randomTrips.py -n map.net.xml -e 20 -o map.trips.xml
```
Por último se genera el archivo de rutas tramo a tramo a partir de los trips que contemplan el punto origen y el punto destino.

```bash
duarouter -n map.net.xml --route-files map.trips.xml -o map.rou.xml --ignore-errors
```
## Modificación de las mismas
En el caso de necesitar modificar alguna de las calles del escenario, vehículos que  se encuentran en la simulación y/o las rutas que deben seguir los mismos, debemos acceder al programa *netedit*, que nos permitirá hacerlo comodamente desde una interfaz gráfica.

```bash
netedit
```

Si se trata de una modificación sencilla como pudiera ser eliminar la ruta que va a seguir un vehículo dada su id no es necesario acceder a *netedit*, simplemente eliminaremos la entrada correspondiente del fichero *.rou.xml

## Pruebas en SUMO
Para probar las rutas que hemos generado previamente, podemos realizarlo en el propio sumo antes de implementarlas en nuestro proyecto de *veins*.
para ello lo abriremos con el comando:

```bash
sumo-gui
```
Y aquí importaremos el fichero *.sumocfg haciendo click en File --> Open Simulation.

El fichero .sumocfg debe ser como el que se indica a continuación:

```xml
<configuration>
  <input>
    <net-file value="*.net.xml"/>
    <route-files value="*.rou.xml"/>
  </input>
  <time>
    <begin value="0"/>
    <end value="500"/>
    <step-length value="0.1"/>
  </time>
  <gui_only>
    <gui-settings-file value="gui-settings.xml"/>
   </gui_only>
</configuration>
```
Indicando las rutas de los archivos *.net.xml y *.rou.xml en él.

# Integración con Omnet++

Una vez con SUMO instalado y corriendo el script que permite la conexión con omnet++, debemos importar los siguientes paquetes a omnet para poder ejecutar nuestras simulaciones de conducción remota y poder analizar así como se comporta la red y el sistema vehicular.
Estos son: inet4.4, simu5G, veins_inet y veins-veins-5.2.

A continuacíon nos apoyaremos en la simulación que se encuentra dentro de simu5G --> simulations --> NR --> cars para desarrollar nuestro proyecto a partir de la misma.

En primer lugar analizamos el funcionamiento del escenario proporcionado y lo simulamos hasta conocer como se comporta. Ahora que sabemos como funciona podemos introducir nuestro mapa personalizado, generado como hemos visto en los pasos anteriores.

Seguidamente hemos buscado en [https://antenasgsm.com/5G/](https://antenasgsm.com/5G/) la posición de las antenas 5G que exixten en la zona del mapa que hemos importado, de manera que las posicionamos en la localización real y la simulación se adecúe con mayor veracidad a la realidad.

Establecemos las comunicaciones entre las parejas de antenas e individualmente cada una de ellas con el nodo upf que posteriormente reenviará el tráfico a través de la red de routers al servidor desde el cual se controlan los vehiculos.

<img src="https://i.imgur.com/cSqSUEp.png" width="100%">

