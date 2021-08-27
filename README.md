# Plantilla de Projecte Bàsic en C

## Organització de Carpetes:
- **bin**: binaris (.exe)
- **build**: fitxers compilats (.o)
- **doc**: fitxers de documentació del projecte (.txt,.pdf,...)
- **inc**: fitxers de capçalera propis del projecte (.h)
- **lib**: fitxers de llibreries externes
- **src**: fitxers de codi font propis del projecte (.c)
- **test**: fitxers de proves

## Instruccions

***MAKEFILE => NO TOCAR (Conté descripció de compilació i tasques de neteja)***

A la carpeta .vscode es troben els següents fitxers:
- **c_cpp_properties.json**: indica rutes de llibreries fora del path de sistema (*/inc* i */lib*)
- **launch.json**: conté configuració de depuració i execució segons plataforma i crida a la tasca prèvia de compilació.
- **tasks.json**: conté configuració de tasques de compilació, execució i neteja. segons plataforma.

Per compilar directament per la consola sols cal cridar make i per netejar make clean, des de l'arrel de la carpeta de projecte.

### Exemple a Windows:
- Compilació: ```mingw32-make```
- Neteja: ```mingw32-make clean```

### Exemple a Linux / MacOS:
- Compilació: ```make```
- Neteja: ```make clean```

**Nota 1**: *Si es vol canviar el nom del programa generat és imprescindible editar al fitxer "Makefile" la variable "APPNAME", tanmateix caldrà editar el fitxer "launch.json" per tal d'indicar el nom del nou executable*.<br />
**Nota 2**: *Per motius d'estandarització, el fitxer principal de tot projecte s'hauria d'anomenar "main.c", amb independència del nom del programa.*<br />
**Nota 3**: *Els fitxers de capçalera (.h) sols han d'incloure constants, declaracions de tipus, funcions, ... MAI CODI!!!*<br />
**Nota 4**: *Els fitxers de capçalera (.h) han d'anar sempre protegits amb una guàrdia tipus ```#ifndef ...... #define ..... #endif```*

## Crèdits
@dgonzalez55 (05/07/2021)
