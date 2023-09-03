# Librería - Software de Gestión

## Descripción

Este es un repositorio para el proyecto de software de gestión de librería. El proyecto se ha desarrollado por iniciativa personal para aplicar los conocimientos adquiridos en el curso de JSP de TodoCode. Se trata de una aplicación de gestión que cubre tres áreas principales: gestión de libros, ventas y empleados.

## Características

* **Gestión de Libros:**
  - Alta, eliminación y modificación de libros en la base de datos.
  - Actualización del número de unidades disponibles de un libro.

* **Ventas:**
  - Registro y seguimiento de ventas realizadas.
  - Visualización del historial de ventas por usuario.

* **Empleados y Usuarios:**
  - Agregar empleados al sistema con credenciales únicas.
  - Gestión de usuarios y permisos.

## Tecnologías Utilizadas

* **Backend:**
  - Java 17: Lenguaje de programación principal.
  - JSP (JavaServer Pages): Para contenido dinámico en el servidor.
  
* **Frontend:**
  - HTML, CSS/SASS y JavaScript: Tecnologías web estándar para la interfaz de usuario.
  - Bootstrap: Framework de diseño para una experiencia visual atractiva y receptiva.

* **Base de Datos:**
  - MySQL: Sistema de gestión de base de datos.

## Requisitos del Entorno

* Java Development Kit (JDK) 17 o superior.
* Servidor de aplicaciones compatible con JSP.
* MySQL Server.

## Instrucciones de Uso

1. Clona este repositorio en tu máquina local.
2. Configura una instancia de MySQL Server y crea una base de datos llamada "db_library".
3. Actualiza el archivo de configuración de la base de datos en `src/main/resources/META-INF/persistence.xml` con tus credenciales y detalles de conexión.
4. Ejecuta la aplicación en un servidor de aplicaciones compatible con JSP.
5. Una vez arrancada la aplicación, intente iniciar sesión con los campos vacios para que se creen las tablas en la base de datos automaticamente.
6. En el administrador de MySQL ejecute la siguiente consulta ```INSERT INTO `ACCESO` (`ID`, `ADMIN`, `NEWORCHANGEPASSWORD`, `PASSWORD`, `USERNAME`) VALUES ('1', '1', '0', '123456', 'root');```
7. Inicie sesión con el usuario `root` y contraseña `123456`.

## Contribución

Si deseas contribuir al proyecto, sigue estos pasos:

Realiza un fork de este repositorio.
Crea una rama para tus cambios: git checkout -b caracteristica-nueva.
Realiza modificaciones y pruebas.
Asegúrate de cumplir con los estándares de estilo y formato.
Crea un pull request describiendo tus cambios.

## Contacto

Para preguntas o problemas, contáctanos en rjlb991102@hotmail.com.
