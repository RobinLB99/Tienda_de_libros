# Librería - Software de Gestión

## Descripción

Este es un repositorio para el proyecto de software de gestión de librería. El proyecto se ha desarrollado por iniciativa personal para aplicar los conocimientos adquiridos en el curso de JSP de TodoCode. Se trata de una aplicación de gestión que cubre tres áreas principales: gestión de libros, ventas/alquiler y empleados.

## Características

* **Gestión de Libros:**
  - Alta, eliminación y modificación de libros en la base de datos.
  - Actualización del número de unidades disponibles de un libro.

* **Ventas o alquiler de libros:**
  - Registro y seguimiento de ventas o alquileres realizados.
  - Visualización del historial de ventas o alquileres por usuario.

* **Empleados y Usuarios:**
  - Agregar empleados al sistema con credenciales únicas.
  - Gestión de usuarios y permisos.

## Tecnologías Utilizadas

* **Backend:**
  - Java 17: Lenguaje de programación principal.
  
* **Frontend:**
  - HTML, CSS/SASS y JavaScript: Tecnologías web estándar para la interfaz de usuario.
  - Bootstrap: Framework de diseño para una experiencia visual atractiva y receptiva.
  - JSP (JavaServer Pages): Para contenido dinámico.

* **Base de Datos:**
  - MySQL: Sistema de gestión de base de datos.

## Requisitos del Entorno

* Java Development Kit (JDK) 17 o superior.
* Servidor de aplicaciones compatible con JSP. **(Apache Tomcat v10.1.10 recomendado)**
* Maven **(v3.9.4 recomendado)**
* MySQL Server.
* Netbeans IDE 18 o superior **(Recomendado)**

## Instrucciones de Instalación

1. Clona este repositorio en tu máquina local.
2. Configura una instancia de servidor MySQL y crea una base de datos llamada "db_library".
3. Actualiza el archivo de configuración de la base de datos en `src/main/resources/META-INF/persistence.xml` con tus credenciales y detalles de conexión.
4. Ejecuta la aplicación en un servidor de aplicaciones compatible con JSP. **(Apache Tomcat v10.1.10 recomendado)**
5. Una vez inicializada la aplicación, intente iniciar sesión con con cualquier dato para que se creen las tablas en la base de datos automaticamente.
6. Una vez creadas las tablas en la base de datos, en el administrador de MySQL ejecute las siguientes consultas:

   **Para añadir los libros**
   
   ```INSERT INTO `LIBRO` (`ID`, `ANIO`, `AUTOR`, `CODIGO`, `NOMBRE`, `PRECIO`, `UNIDADES`) VALUES
(1, '1968', 'Gabriel García Márquez', '1235478988', 'Cien años de soledad', 19.99, 55),
(2, '2001', 'J.K. Rowling', '7894561230', 'Harry Potter y la piedra filosofal', 24.99, 40),
(3, '1954', 'J.R.R. Tolkien', '4561237890', 'El Señor de los Anillos', 29.99, 30),
(4, '1984', 'George Orwell', '3216549870', '1984', 12.99, 25),
(5, '1862', 'Victor Hugo', '6549873210', 'Los Miserables', 18.99, 35),
(6, '1997', 'J.K. Rowling', '9876543210', 'Harry Potter y la cámara secreta', 21.99, 28),
(7, '1960', 'Harper Lee', '3333333333', 'Matar a un ruiseñor', 16.99, 20),
(8, '2003', 'Dan Brown', '4444444444', 'El Código Da Vinci', 14.99, 45),
(9, '2005', 'Khaled Hosseini', '5555555555', 'Cometas en el cielo', 13.99, 32),
(10, '2010', 'Suzanne Collins', '6666666666', 'Los juegos del hambre', 17.99, 38);```

    **Para añadir los usuarios**

    ```INSERT INTO `ACCESO` (`ID`, `ADMIN`, `NEWORCHANGEPASSWORD`, `PASSWORD`, `USERNAME`) VALUES
(1, 1, 1, '123456', 'mgonzales99'),
(2, 0, 0, '-', '-'),
(3, 0, 0, '-', '-');```


    **Para añadir los empleados**

   ```INSERT INTO `EMPLEADO` (`ID`, `APELLIDOS`, `CEDULA`, `FECHANACIMIENTO`, `FUNCION`, `NOMBRE`, `TELEFONO`, `CREDENCIAL_ID`) VALUES
(1, 'González Pérez', '0987458965', '1999-01-01', 'admin', 'María Isabel', '0944149020', 1),
(2, 'López Sánchez', '0914702279', '1971-01-01', 'perchero', 'Carlos Alberto', '0954785698', 2),
(3, 'Martínez Rodríguez', '0985478569', '1968-01-01', 'cajero', 'Laura Beatriz', '0968745896', 3);```

   
8. Inicie sesión con el usuario `mgonzales99` con contraseña `123456` y pruebe la aplicación.

## Capturas
![Libros disponibles](https://github.com/RobinLB99/Tienda_de_libros/blob/master/.screenshots/libros_disponibles.png)

![Gestion de usuarios](https://github.com/RobinLB99/Tienda_de_libros/blob/master/.screenshots/gestion_de_usuario.png)

![Libros a elegir](https://github.com/RobinLB99/Tienda_de_libros/blob/master/.screenshots/libros_elegir.png)


## Contribución

Si deseas contribuir al proyecto, sigue estos pasos:

Realiza un fork de este repositorio.
Crea una rama para tus cambios: git checkout -b caracteristica-nueva.
Realiza modificaciones y pruebas.
Asegúrate de cumplir con los estándares de estilo y formato.
Crea un pull request describiendo tus cambios.

## Contacto

Para preguntas o problemas, contáctame en rjlb991102@hotmail.com.
