---




# Flutter Technical Test

https://github.com/user-attachments/assets/dd302da6-1fac-4fa7-a99b-b92edd4a4849


## Descripción

Esta es una aplicación en Flutter que implementa varias funcionalidades clave y sigue una arquitectura basada en la organización de carpetas en `domain` e `infrastructure`. La aplicación permite la manipulación de archivos, cambio de temas, visualización de PDF y la gestión de datos localmente usando la base de datos Isar.

Version de flutter
   ```bash
   Flutter 3.24.1 • channel stable
   Dart 3.5.1 • DevTools 2.37.2
   ```

### Funcionalidades principales:
- **Drawer Navigation**: Navegación intuitiva utilizando un Drawer para acceder a diferentes secciones de la app.
- **AppBar y botones**: Uso de AppBar para la navegación principal y botones para diferentes acciones en la aplicación.
- **ListTile y Inputs**: Presentación de información mediante `ListTile` y manejo de formularios con inputs personalizados.
- **PDF Viewer**: Visualización de documentos PDF usando un visor embebido.
- **File Picker**: Carga de archivos mediante el uso de un selector de archivos (FilePicker).
- **Theme Changer**: Cambio de tema dinámico para alternar entre modo claro y oscuro, y ajuste de colores primarios.
- **Perfil**: Pantalla de perfil del usuario donde se muestran los detalles personales.
- **Almacenamiento local**: Uso de Isar como base de datos local para almacenar archivos seleccionados desde el `FilePicker`.

### Estructura del Proyecto
La aplicación sigue una arquitectura limpia, donde el código está organizado en dos principales capas:

1. **Domain**: Contiene las entidades y lógica de negocio.
2. **Infrastructure**: Se encarga de la implementación, manejo de bases de datos, y otros aspectos técnicos.

### Tecnologías utilizadas
- **Flutter**: Framework principal para el desarrollo de la aplicación.
- **Isar**: Base de datos local para almacenar archivos y otros datos de forma rápida y eficiente.
- **File Picker**: Paquete para la selección de archivos desde el dispositivo.
- **PDF Viewer**: Paquete para visualizar documentos PDF dentro de la app.

### Instalación

1. Clona este repositorio:
   ```bash
   git clone https://github.com/tu-repo/flutter-tech-test.git
   ```
2. Instala las dependencias:
   ```bash
   flutter pub get
   ```
3. Ejecuta la aplicación:
   ```bash
   flutter run
   ```

### Uso
- **Drawer**: Usa el Drawer para navegar entre las diferentes pantallas, incluyendo la pantalla de perfil y de tema.
- **Perfil**: Consulta la pantalla de perfil para ver la información del usuario.
- **Theme Changer**: Cambia entre el tema claro y oscuro.
- **File Upload**: Selecciona un archivo desde tu dispositivo usando el `FilePicker` y guárdalo en la base de datos local Isar.
- **ReordeableList**: Lista ordenable que permite seleccionar un documento para verlo en el componente pdfViewer que no supere los 2MB asi mismo eliminar los documentos agregados

### Arquitectura
La organización del código está dividida en dos carpetas principales:
- **Domain**: Incluye las entidades y reglas de negocio.
- **Infrastructure**: Maneja la persistencia de datos y las interacciones técnicas, como el uso de la base de datos Isar.


---
