-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-10-2020 a las 17:30:22
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `personas`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ssp_alta_usuario` (`pApellido` VARCHAR(60), `pNombre` VARCHAR(60), `pEmail` VARCHAR(30), `pTelefono` VARCHAR(10), `pEdad` INT)  SALIR:BEGIN
	/*
    Permite dar de alta un usuario controlando que el email y  el telefono  no exista ya y que el nombre,apellido , email, telefono y edad  no esten vacios , ni con el estado NULL. 
    Devuelve OK + Id o el mensaje de error en Mensaje.
    */
     DECLARE pIdusuario int ;
     
      -- Manejo de error en la transacción
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN 
		SHOW ERRORS;
		SELECT 'Error en la transacción. Contáctese con el administrador.' Mensaje;
		ROLLBACK;
	END;
     
     -- Controla que el apellido sea obligatorio 
	IF pApellido = '' OR pApellido IS NULL THEN
		SELECT 'Debe proveer un apellido para el usuario' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;
     -- Controla que el nombre del usuario  sea obligatorio 
	IF pNombre = '' OR pNombre IS NULL THEN
		SELECT 'Debe proveer un nombre para  el usuario' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;
     -- Controla que el email del usuario  sea obligatorio 
	IF pEmail = '' OR pEmail IS NULL THEN
		SELECT 'Debe proveer un email para  el usuario' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;
      -- Controla que el telefono del usuario  sea obligatorio 
	IF pTelefono = '' OR pTelefono IS NULL THEN
		SELECT 'Debe proveer un numero telefonico para  el usuario' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;
    -- Controla que la edad  del usuario  sea obligatorio 
	IF pEdad = '' OR pEdad IS NULL THEN
		SELECT 'Debe proveer la edad del usuario' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;

    -- controla la existencia de un email 
  IF EXISTS(SELECT Email FROM usuario WHERE Email = pEmail) THEN
		SELECT 'ya existe  un usuario  con ese email' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;
    
      -- controla la existencia de un numero telefonico 
  IF EXISTS(SELECT Telefono FROM usuario WHERE Telefono = pTelefono) THEN
		SELECT 'ya existe  un usuario  con ese numero telefonico' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;
    
  
    START TRANSACTION;
    	SET  pIdusuario = 1 + (SELECT COALESCE(MAX(idUsuario),0)
								FROM usuario);
		INSERT INTO usuario VALUES(pIdusuario,pApellido,pNombre,pEmail,pTelefono,pEdad);
        SELECT 'OK' AS Mensaje;
    COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ssp_borra_usuario` (`pIdUsuario` INT)  SALIR:BEGIN
    /*
    Permite borrar un usuario 
    */
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		-- SHOW ERRORS;
		SELECT 'Error en la transacción. Contáctese con el administrador.' Mensaje;
		ROLLBACK;
	END;
    -- Controla que no exista la posicion en la tabla clientes a modificar
	IF NOT EXISTS(SELECT * FROM Usuario WHERE idUsuario = pIdUsuario) THEN
		SELECT 'No existe un usuario en  la posicion que se desea modificar' AS Mensaje;
		LEAVE SALIR;
    END IF;

     START TRANSACTION;
         -- Borra usuario
         DELETE FROM Usuario WHERE idUsuario = pIdUsuario;
        SELECT 'OK' AS Mensaje;
	COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ssp_dame_usuario` (`pUsuario` INT)  BEGIN
	/*
	Procedimiento que sirve para instanciar un Usuario desde la base de datos. 
    */
	 SELECT * FROM Usuario WHERE idUsuario = pUsuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ssp_listar_usuarios` ()  BEGIN
		/*
		Permite listar los usuarios ordenados por el Id.
		*/
  -- Manejo de error en la transacción
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		SELECT 'Error en la transacción. Contáctese con el administrador.' Mensaje;
		ROLLBACK;
	END;
	SELECT * FROM Usuario
    ORDER BY idUsuario ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ssp_modifica_usuario` (`pIdUsuario` INT, `pApellido` VARCHAR(60), `pNombre` VARCHAR(60), `pEmail` VARCHAR(30), `pTelefono` VARCHAR(10), `pEdad` INT)  SALIR: BEGIN
			/*
			   Permite modificar un usuario existente, controlando que el Apellido,Nombre, Telefono , Email  y edad  no sean vacios , ni  NULOS. Controla que el email  y el telefono no existan
			   Devuelve OK o el mensaje de error en Mensaje.
			*/
            
              -- Manejo de error en la transacción
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN 
		SHOW ERRORS;
		SELECT 'Error en la transacción. Contáctese con el administrador.' Mensaje;
		ROLLBACK;
	END;

    
    -- Controla que el cliente sea obligatorio 
	IF NOT EXISTS(SELECT idUsuario FROM usuario WHERE idUsuario = pIdUsuario) THEN
		SELECT 'Debe proveer un usuario existen.' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;
      -- Controla que el apellido sea obligatorio 
	IF pApellido = '' OR pApellido IS NULL THEN
		SELECT 'Debe proveer un apellido para el usuario.' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;
     -- Controla que el nombre sea obligatorio 
	IF pNombre = '' OR pNombre IS NULL THEN
		SELECT 'Debe proveer un nombre para el usuario.' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;
        -- Controla que el email sea obligatorio. 
	IF pEmail = '' OR pEmail IS NULL THEN
		SELECT 'Debe proveer un email para el usuario.' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;
    -- Controla que el telefono sea obligatorio 
	IF pTelefono = '' OR pTelefono IS NULL THEN
		SELECT 'Debe proveer un numero telefonico para el usuario.' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;

     -- Controla que el telefono  sea obligatorio. 
	IF pEdad = 0 OR pEdad IS NULL THEN
		SELECT 'Debe proveer la edad corespondiente  para el usuario.' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;
    


  	START TRANSACTION;
		UPDATE usuario SET Apellido = pApellido, Nombre = pNombre ,Email = pEmail , Telefono = pTelefono, Edad =pEdad  WHERE  idUsuario = pIdUsuario;
		SELECT 'OK' AS Mensaje;
		COMMIT;
  END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `Apellido` varchar(60) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  `Edad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `Apellido`, `Nombre`, `Email`, `Telefono`, `Edad`) VALUES
(1, 'Cordoba', 'Facundo', 'cordobafs@gmail.com', '4922061', 29);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Telefono` (`Telefono`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
