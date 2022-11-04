Diseño de escenarios de simulación para el análisis de servicios de conducción remota basados en comunicaciones 5G con garantias de calidad de servicio.
=======

Para realizar este proyecto nos apoyaremos de el framework de simulación *veins*, que integra *SUMO* (herramienta de modelado de carreteras, vehículos y tráfico entre otras) y *OMNET++* (que realizará toda la parte de las comunicaciones entre los vehículos y el centro de control). Para implementar estas comunicaciones emplearemos *simu5G*, que nos modelará elementos de las redes 5G.


Generación de rutas
----------
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
Por último se genera el archivo de rutas tramoa tramo a partir de los trips que contemplan el punt origen y el punto destino.

```bash
duarouter -n map.net.xml --route-files map.trips.xml -o map.rou.xml --ignore-errors
```