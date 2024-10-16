# Prueba Técnica - SuperLikers

Este proyecto es una prueba técnica administrada por SuperLikers para evaluar las habilidades de un desarrollador móvil. La prueba consiste en la implementación de dos vistas principales: la vista de LogIn y la vista de KPIs. El diseño y las funcionalidades de ambas vistas fueron proporcionados, y la implementación respeta los lineamientos solicitados.

La aplicación fue desarrollada utilizando Flutter en su versión 3.24.0 y está diseñada para funcionar en dispositivos iOS y Android.

**Video de la App (Android e iOS)**
[Video del Funcionamiento](https://www.mediafire.com/file/pxk8kjd0lqt17a0/test-app-superlikers.mp4/file)

## Requisitos

- Flutter SDK: 3.24.0
- Dart SDK: Incluido en el SDK de Flutter
- Dependencias: Todas las dependencias necesarias están definidas en el archivo `pubspec.yaml`.
## Arquitectura Limpia
![Logo](https://i.blogs.es/28531a/clean/450_1000.webp)

Este proyecto sigue el patrón de Arquitectura Limpia, la cual divide el código en tres capas principales:
- **Capa de dominio:** Contiene todas las reglas de negocio y casos de uso del proyecto. Esta capa es independiente de las demás y define los contratos que deben cumplir las otras capas.
- **Capa de infraestructura:** Contiene toda la lógica de conexión con fuentes de información externas, como APIs, servicios de persistencia, etc.
- **Capa de presentación:** Se encarga de gestionar la interfaz de usuario y todos los componentes visuales de la aplicación. Aquí es donde se implementa el diseño proporcionado.
- **Capa de configuración (para Flutter):** Maneja las rutas, constantes, temas y variables de entorno, facilitando la gestión de configuraciones en toda la aplicación.
## Instalar Flutter
Si desea ejecutar el proyecto en modo desarrollo, debe instalar Flutter y todos los componentes requeridos. Debido a que Flutter se puede instalar en múltiples sistemas operativos (Windows, macOS y Linux), se proporciona un video tutorial para cada sistema. **Tenga en cuenta que debe instalar una versión de Flutter 3.24.0 o superior**.

Tener en cuenta que, para poder ejecutar la aplicación en iOS se debe contar con un entorno macOs.

- Windows: [Video tutorial para Windows](https://www.youtube.com/watch?v=3N8MMvLBxss)
- macOs: [Video tutorial para macOs](https://www.youtube.com/watch?v=W9clR_Wg3ho)
- Linux: [Video tutorial para Linux](https://www.youtube.com/watch?v=JHDEzJOHhnE)

## Ejecutar Proyecto

- Clonar proyecto del repo
```bash
  git clone https://github.com/macsDevelop008/modelo-para-ganar.git
```
- crear archivo `.env`: copiar y pegar el archivo `.env.template` eliminar '.template' Para esta prueba se dejaron expuestas variables de entorno que **no** deberían estarlo, pero es para propocitos de la ejecución de la prueba por parte de terceros.

- Abrir proyecto y ejecutar
```bash
  flutter pub get
```
- Abrir un emulador o conectar un dispositivo móvil al ordenador y ejecutar
```bash
  flutter devices
```
- Del listado identificar el dispositivo objetivo y copiar su id y ejecutar app, ejemplo:
```bash
  flutter run -d emulator-4444
```

**Pruebas Unitarias**

También se implementaron pruebas unitarias para testear la lógica de la capa de infraestructura. Estas pruebas se encuentran en la carpeta "test" del proyecto. Para ejecutar estas pruebas y verificar el correcto funcionamiento, ejecute el siguiente comando:
```bash
  flutter test
```

## Ejecutables 

En los siguientes enlaces podrá descargar los ejecutables para Android (.apk) y para iOS (.ipa) para ver la aplicación en un dispositivo móvil. Dentro de la app, en el LogIn se dejaron por defecto la **cuenta y contraseña** en los inputs de texto.

 - [Ejecutable para Android](https://www.mediafire.com/file/wlgs8ksub2oy5gx/modelo_ganar_v100.apk/file)
 - [Ejecutable para iOS](https://www.mediafire.com/file/uc7n3vpilu9kj64/modelo_ganar_v100.ipa/file)

**Instalación**

- **Android**: 
    1. Descargar el ejecutable en tu dispositivo móvil.
    2. Se descargará un archivo llamado **modelo_ganar_v100.apk**
    3. Seleccionar e instalar (Se mostrará una ventana de advertencia, ya que no es una aplicación con verificación de Google)

- **iOS**
Debido a las restricciones de Apple en iOS, no se pueden instalar archivos .ipa que estén fuera de la App Store directamente. Sin embargo, siguiendo el paso a paso del siguiente enlace, es posible instalar el .ipa y probar la aplicación:
[Insalar .ipa externa](https://www.youtube.com/watch?v=7GND2msNu54)
## Funcionalidades (iOS y Android)

- En la vista **LogIn** se implementaron las siguientes funcionalidades: inicio de sesión mediante credenciales válidas, consumiendo el endpoint suministrado y requerido por la prueba para dicha función. También se realizan **validaciones** para asegurarse de que todos los campos solicitados contengan información antes de consumir el servicio. Además, se implementó una funcionalidad en el texto de ayuda que **permite ir a WhatsApp** y enviar un mensaje (en esta versión se incluyó mi número personal). En iOS se solicitará permiso para poder abrir app por medio de un enlace.
- Una vez realizado el inicio de sesión, la aplicación **almacena** el ID del usuario y el token retornado desde la API. Con esto, al cerrar y volver a ingresar a la aplicación, no será necesario ingresar nuevamente las credenciales hasta cerrar sesión. Además, el inicio de sesión está preparado para **recepcionar errores**.
- Una vez realizado el inicio de sesión de forma satisfactoria, la aplicación solicitará permisos para poder recepcionar **notificaciones push**.
- Una vez **dentro de la aplicación**, en la vista de los **KPIs**, se realiza la petición para obtener todos los KPIs del usuario logueado. Después de obtener esa información, se lleva a cabo **el siguiente proceso**: se filtran los KPIs que tienen al menos una *"_meta_"*, ya que si no tienen meta, no tiene sentido mostrarlos al usuario. En caso de que sí tengan "_meta_" pero no **"_avance_"**, el avance se toma como 0 por defecto. Luego, se filtran para agrupar por **"cartones"** y **"hectolitros"**. A partir de aquí, también se extraen los valores necesarios para calcular el **porcentaje individual** de cada KPI con su nombre, y uno general para el *slider*. De este modo, se dibujan en pantalla los KPIs que al menos tengan "_meta_" con su respectivo porcentaje y filtro.
- También se creó un menú lateral básico que contiene dos botones: **"Cerrar sesión"**, el cual permite cerrar la sesión y volver a la vista de LogIn, y el botón **"Crear participante"**.
- Para la creación del participante, primero se consume un **endpoint que permite obtener todos los campos necesarios para crear un participante** en la campaña determinada. En esta versión de la aplicación, solo se solicitan los campos obligatorios que tienen formato de cadena (String) o numérico. Una vez hecho esto, se dibujan en pantalla los campos para que el usuario ingrese los datos, y finalmente se consume el **endpoint para crear o registrar al participante**.

**Todas las peticiones consumidas y los filtros principales se encuentran en la capa de infraestructura.**


## Nota del Desarrollador
La creación de este proyecto fue muy interesante y demandó bastante tiempo, pero fue un buen reto personal. Espero que con esta prueba queden satisfechos y puedan considerarme para la vacante. Además, quiero aclarar que soy una persona versátil y adaptable. Aunque mi especialidad es el desarrollo móvil, también estoy abierto a aprender nuevas tecnologías y áreas de desarrollo, como Angular o la tecnología que se utilice para el Backend. Quedo atento a cualquier duda o comentario. ¡Gracias! :)

- macsevelop008@gmail.com
- 3108555214
