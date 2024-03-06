# appalgarn

Este proyecto es una aplicación Flutter que utiliza una base de datos SQLite para almacenar y gestionar datos localmente en el dispositivo. Proporciona una interfaz de usuario para realizar diversas operaciones, como agregar nuevos clientes, servicios, ver estadísticas de servicios, y más.

## Estructura del Proyecto

El proyecto está organizado de la siguiente manera:

- `main.dart`: Punto de entrada de la aplicación.
- `data.dart`: Contiene las clases de modelos para las tablas de la base de datos, como `Usuario`, `Servicio`, `Factura`, `DetFac`, para reflejar la estructura de la base de datos.
- `db.dart`: Contiene la lógica para interactuar con la base de datos SQLite, incluyendo la inicialización, consultas CRUD y gestión de transacciones.
- `widgets/`: Contiene los diferentes componentes de la aplicación, como pantallas o funcionalidades específicas.
  - `background.dart`: Componente para el fondo de la aplicación.
  - `factura.dart`: Pantalla para mostrar detalles de una factura.
  - `myhome.dart`: Pantalla de inicio.
  - `new_client.dart`: Pantalla para agregar un nuevo cliente.
  - `new_service.dart`: Pantalla para agregar un nuevo servicio.
  - `service_statistics.dart`: Pantalla para mostrar estadísticas de servicios.
  - `user.dart`: Pantalla para mostrar información y gestionar usuarios.
- `database/`: Contiene archivos relacionados con la configuración y gestión de la base de datos SQLite.
  - `sqlite_database.dart`: Configuración de la base de datos y clases de ayuda para interactuar con ella.

## Uso

1. Clona este repositorio en tu máquina local:

```bash
git clone https://github.com/tuusuario/flutter-sqlite-app.git
```
2. Navega al directorio del proyecto:
```bash
cd appalgarn
```
3. Instala las dependencias necesarias:

```bash
flutter pub get
```

4. Ejecuta la aplicación en un emulador o dispositivo físico:

```bash
flutter run
```

## Contribución

Las contribuciones son bienvenidas. Si tienes alguna idea para mejorar esta aplicación, por favor, abre un problema o envía una solicitud de extracción.
Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo LICENSE para más detalles.

