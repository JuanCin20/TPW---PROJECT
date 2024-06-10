DROP DATABASE IF EXISTS TPW_DIGITAL_TECH_WEB_APP;

-- CREACIÓN DE LA BASE DE DATOS
CREATE DATABASE TPW_DIGITAL_TECH_WEB_APP;
USE TPW_DIGITAL_TECH_WEB_APP;

-- CREACIÓN DE LA TABLA CARGO
CREATE TABLE `tabla_cargo` (
`ID_Cargo` INT (10) AUTO_INCREMENT PRIMARY KEY,
`Descripcion_Cargo` VARCHAR (50) NOT NULL
);

-- CREACIÓN DE LA TABLA USUARIO
CREATE TABLE `tabla_usuario` (
`ID_Usuario` INT (10) AUTO_INCREMENT PRIMARY KEY,
`ID_Cargo` INT (10),
`Username_Usuario` VARCHAR (80) NOT NULL,
`Password_Usuario` VARCHAR (80) NOT NULL,
`E_Mail_Usuario` VARCHAR (80) NOT NULL
);

-- CREACIÓN DE LA TABLA CATEGORÍA
CREATE TABLE `tabla_categoria` (
`ID_Categoria` INT (10) AUTO_INCREMENT PRIMARY KEY,
`Nombre_Categoria` VARCHAR (50) NOT NULL
);

-- CREACIÓN DE LA TABLA PRODUCTO
CREATE TABLE `tabla_producto` (
`ID_Producto` INT (10) AUTO_INCREMENT PRIMARY KEY,
`ID_Categoria` INT (10) NOT NULL,
`Marca_Producto` VARCHAR (50) NOT NULL,
`Nombre_Producto` VARCHAR (255) NOT NULL,
`Precio_Producto` DECIMAL (20,2) NOT NULL,
`Descripcion_Producto` TEXT NOT NULL,
`Imagen_Producto` VARCHAR (255) NOT NULL
);

-- CREACIÓN DE LA TABLA VENTA
CREATE TABLE `tabla_venta` (
`ID_Venta` INT (10) AUTO_INCREMENT PRIMARY KEY,
`ID_Usuario` INT (10) NOT NULL,
`Clave_Transaccion_Venta` VARCHAR (250) NOT NULL,
`Paypal_Datos_Venta` TEXT NOT NULL,
`Fecha_Venta` DATETIME NOT NULL,
`Direccion_Venta` VARCHAR (5000) NOT NULL,
`Total_Venta` DECIMAL (60,2) NOT NULL,
`Estatus_Venta` VARCHAR (200) NOT NULL
);

-- CREACIÓN DE LA TABLA DETALLE DE VENTA
CREATE TABLE `tabla_detalle_venta` (
`ID_Detalle_Venta` INT (10) AUTO_INCREMENT PRIMARY KEY,
`ID_Venta` INT (10) NOT NULL,
`ID_Producto` INT (10) NOT NULL,
`Precio_Detalle_Venta` DECIMAL (20,2) NOT NULL,
`Cantidad_Detalle_Venta` INT (10) NOT NULL
);

-- CREACIÓN DE LA TABLA "IMAGEN CALIDAD"
CREATE TABLE `tabla_imagen_calidad` (
`ID_Imagen_Calidad` INT (10) AUTO_INCREMENT PRIMARY KEY,
`ID_Producto` INT (10) NOT NULL,
`Nombre_Imagen_Calidad` VARCHAR (255) NOT NULL,
`Img_Imagen_Calidad` VARCHAR (255) NOT NULL
);

-- ADD FOREING KEYS
ALTER TABLE `tabla_usuario`
  ADD CONSTRAINT `tabla_usuario_ibfk_1` FOREIGN KEY (`ID_Cargo`) REFERENCES `tabla_cargo` (`ID_Cargo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

ALTER TABLE `tabla_producto`
  ADD CONSTRAINT `tabla_producto_ibfk_1` FOREIGN KEY (`ID_Categoria`) REFERENCES `tabla_categoria` (`ID_Categoria`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

ALTER TABLE `tabla_venta`
  ADD CONSTRAINT `tabla_venta_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `tabla_usuario` (`ID_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

ALTER TABLE `tabla_detalle_venta`
  ADD CONSTRAINT `tabla_detalle_venta_ibfk_1` FOREIGN KEY (`ID_Venta`) REFERENCES `tabla_venta` (`ID_Venta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tabla_detalle_venta_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `tabla_producto` (`ID_Producto`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

ALTER TABLE `tabla_imagen_calidad`
  ADD CONSTRAINT `tabla_imagen_calidad_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `tabla_producto` (`ID_Producto`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

SHOW TABLES;

-- MOSTRAR TABLAS
SELECT * FROM tabla_cargo;
SELECT * FROM tabla_usuario;
SELECT * FROM tabla_categoria;
SELECT * FROM tabla_producto;
SELECT * FROM tabla_venta;
SELECT * FROM tabla_detalle_venta;
SELECT * FROM tabla_imagen_calidad;
SELECT * FROM tabla_producto;

TRUNCATE TABLE tabla_cargo;
TRUNCATE TABLE tabla_usuario;
TRUNCATE TABLE tabla_categoria;
TRUNCATE TABLE tabla_producto;
TRUNCATE TABLE tabla_venta;
TRUNCATE TABLE tabla_detalle_venta;
TRUNCATE TABLE tabla_imagen_calidad;

INSERT INTO `tabla_cargo` (`Descripcion_Cargo`)
VALUES ('Administrador');
INSERT INTO `tabla_cargo` (`Descripcion_Cargo`)
VALUES ('Cliente');

INSERT INTO `tabla_usuario` (`ID_Cargo`, `Username_Usuario`, `Password_Usuario`, `E_Mail_Usuario`)
VALUES ('1', 'JuanCin20', 'JUANCIn080604', 'JuanCin080604@gmail.com');
INSERT INTO `tabla_usuario` (`ID_Cargo`, `Username_Usuario`, `Password_Usuario`, `E_Mail_Usuario`)
VALUES ('2', 'Pieritazo1211', 'Melocotoso1211', 'pieritazo1211@gmail.com');
INSERT INTO `tabla_usuario` (`ID_Cargo`, `Username_Usuario`, `Password_Usuario`, `E_Mail_Usuario`)
VALUES ('2', 'Lupesu89', 'Maxima10', 'mapesu89@gmail.com');

INSERT INTO `tabla_categoria` (`Nombre_Categoria`)
VALUES ('Motherboard');
INSERT INTO `tabla_categoria` (`Nombre_Categoria`)
VALUES ('CPU');
INSERT INTO `tabla_categoria` (`Nombre_Categoria`)
VALUES ('GPU');
INSERT INTO `tabla_categoria` (`Nombre_Categoria`)
VALUES ('RAM Memory');
INSERT INTO `tabla_categoria` (`Nombre_Categoria`)
VALUES ('Keyboard');
INSERT INTO `tabla_categoria` (`Nombre_Categoria`)
VALUES ('Mouse');
INSERT INTO `tabla_categoria` (`Nombre_Categoria`)
VALUES ('Case');
INSERT INTO `tabla_categoria` (`Nombre_Categoria`)
VALUES ('Almacenamiento');
INSERT INTO `tabla_categoria` (`Nombre_Categoria`)
VALUES ('Monitor');
INSERT INTO `tabla_categoria` (`Nombre_Categoria`)
VALUES ('PSU');

INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('1', 'GIGABYTE', 'MOTHERBOARD GIGABYTE X670 AORUS ELITE AX, CHIPSET AMD X670, SOCKET AMD AM5, ATX', '1360.00', 'Motherboard Gigabyte X670 AORUS ELITE AX, Chipset AMD X670, Socket AMD AM5, ATX Soporta Procesadores AMD Ryzen 7000 Series, 4 x ranuras de memoria DDR5 / maximo de 128 GB, Almacenamiento 4 x M.2 Key-M slots / 4 x SATA 6Gb/s, Sonido Realtek Audio CODEC / Audio HD, 1 x Realtek 2.5 Gbps Ethernet (RJ-45), WLAN AMD Wi-Fi 6E RZ616 (MT7922A22M) / 802.11a/b/g/n/ac/ax / 2.4/5/6 GHz / Bluetooth 5.2, Formato ATX.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/a/7/a725b527f6868780b65fa957ffe35135_3.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('1', 'GIGABYTE', 'MOTHERBOARD GIGABYTE Z790 AORUS ELITE AX (REV. 1.0), CHIPSET INTEL Z790, LGA1700, ATX', '1410.00', 'Motherboard Gigabyte Z790 AORUS ELITE AX (rev. 1.0), Chipset Intel Z790, LGA1700, ATX Soporta Procesadores de 13va y 12va Generacion Intel Core i9 / i7 / i5 / i3 / Pentium Gold / Celeron, 4 x ranuras de memoria DDR5 / maximo de 128 GB, Almacenamiento 4 x M.2 Key-M slots / 6 x SATA 6Gb/s, Sonido Realtek Audio CODEC / Audio HD, 1 x Realtek 2.5 Gbps Ethernet (RJ-45), WLAN WiFi 6E AX211 (802.11 a/b/g/n/ac/ax) / 2.4/5GHz / Bluetooth v5.3, Formato ATX.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/9/4/94d414f45aef292e63c5c3b69453a1c5_3.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('1', 'MSI', 'MOTHERBOARD MSI PRO B650-P WIFI, CHIPSET AMD B650, SOCKET AMD AM5, ATX', '935.00', 'Motherboard MSI PRO B650-P WIFI, Chipset AMD B650, Socket AMD AM5, ATX Soporta Procesadores AMD Ryzen 7000 Series, 4 x ranuras de memoria DDR5 / maximo de 128 GB, Almacenamiento 2 x M.2 Key-M slots / 6 x SATA 6Gb/s, Sonido Realtek Audio CODEC / Audio HD, 1 x Realtek 8125BG 2.5 Gbps Ethernet (RJ-45), WLAN AMD Wi-Fi 6E 802.11a/b/g/n/ac/ax / 2.4/5/6 GHz / Bluetooth 5.3, Formato ATX.', 'https://imagenes.deltron.com.pe/images/productos/on-line/items/large/mb/ms/mbmsprob650-pwf.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('1', 'MSI', 'MOTHERBOARD MSI MAG Z790 TOMAHAWK WIFI, CHIPSET INTEL Z790, LGA1700, ATX', '1430.00', 'Motherboard MSI MAG Z790 TOMAHAWK WIFI, Chipset Intel Z790, LGA1700, ATX Soporta Procesadores de 13va y 12ma Generacion Intel Core i9 / i7 / i5 / i3 / Pentium Gold / Celeron, 4 x ranuras de memoria DDR5 / maximo de 128 GB, Almacenamiento 4 x M.2 Key-M slots / 7 x SATA 6Gb/s, Sonido Realtek ALC4080 Codec / 7.1-Channel High Definition Audio, 1 x Intel 2.5Gbps (RJ-45), WLAN Intel Wi-Fi 6E AX201 / 802.11a/b/g/n/ac/ax / 2.4/5/6 GHz, Formato ATX.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/9/7/97edd36ae833f204257df14c69f34aaa_3.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('1', 'MSI', 'MOTHERBOARD MSI MAG B650 TOMAHAWK WIFI, CHIPSET AMD B650, SOCKET AMD AM5, ATX', '1040.00', 'Motherboard MSI MAG B650 TOMAHAWK WIFI, Chipset AMD B650, Socket AMD AM5, ATX Soporta Procesadores de escritorio AMD Socket AM5 Ryzen 7000 Series, 4 x ranuras de memoria DDR5 / maximo de 128GB, Almacenamiento 3 x M.2 Key-M slots / 6 x SATA 6Gb/s, Sonido Realtek ALC4080 Codec / 7.1-Channel High Performance Audio, 1 x Realtek RTL8125B 2.5Gbps Ethernet (RJ-45), WLAN AMD Wi-Fi 6E (802.11 a/b/g/n/ac/ax) / 2.4/5/6GHz / Bluetooth v5.3, Formato ATX.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/2/3/23f189881861bfee5b0a5653be6de846_3.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('1', 'ASUS', 'MOTHERBOARD ASUS PRIME X670-P, CHIPSET AMD X670, SOCKET AMD AM5, ATX', '935.00', 'Motherboard ASUS PRIME X670-P, Chipset AMD X670, Socket AMD AM5, ATX Soporta Procesadores de escritorio AMD Socket AM5 Ryzen 7000 Series, 4 x ranuras de memoria DDR5 / maximo de 128GB, Almacenamiento 3 x M.2 Key-M slots / 6 x SATA 6Gb/s, Sonido Realtek 7.1 Surround Sound High Definition Audio CODEC, 1 x Realtek 2.5Gbps Ethernet (RJ-45), Formato ATX.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/8/2/8203ffecbb977be32ec20042a8b62ecd_5.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('1', 'ASUS', 'MOTHERBOARD ASUS ROG CROSSHAIR X670E HERO, CHIPSET AMD X670, SOCKET AMD AM5, ATX', '3050.00', 'Motherboard ASUS ROG CROSSHAIR X670E HERO, Chipset AMD X670, Socket AMD AM5, ATX Soporta Procesadores de escritorio AMD Socket AM5 Ryzen 7000 Series, 4 x ranuras de memoria DDR5 / maximo de 128GB, Almacenamiento 4 x M.2 Key-M slots / 6 x SATA 6Gb/s, Sonido ROG SupremeFX 7.1 Surround Sound High Definition Audio CODEC ALC4082, 1 x Intel 2.5Gbps Ethernet (RJ-45), WLAN Wi-Fi 6E (802.11 a/b/g/n/ac/ax) / 2.4/5/6GHz + Bluetooth v5.3, Formato ATX.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/f/6/f6b07bbca2734240202b6a954e3f9520.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('1', 'MSI', 'MOTHERBOARD MSI PRO Z790-P WIFI, CHIPSET INTEL Z790, LGA1700, ATX', '1070.00', 'Motherboard MSI PRO Z790-P WIFI, Chipset Intel Z790, LGA1700, ATX Soporta Procesadores de 13ava y 12ava Generacion Intel Core i9 / i7 / i5 / i3 / Pentium Gold / Celeron, 4 x ranuras de memoria DDR5 / maximo de 192GB, Almacenamiento 4 x M.2 Key-M slots / 6 x SATA 6Gb/s, Sonido Realtek ALC897 Codec / Audio HD / 7.1-Channel, 1 x Realtek 2.5Gbps Ethernet (RJ-45), WLAN Intel Wi-Fi 6E / 2.4/ 5/ 6GHz / 802.11a/b/g/n/ac/ax, Bluetooth 5.3, Formato ATX.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/5/3/53ff8d65d5599f7ba752202f279bab9d_4.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('1', 'ASUS', 'MOTHERBOARD ASUS ROG STRIX B650E-E GAMING WIFI, CHIPSET AMD B650, SOCKET AMD AM5, ATX', '1630.00', 'Motherboard ASUS ROG STRIX B650E-E GAMING WIFI, Chipset AMD B650, Socket AMD AM5, ATX Soporta Procesadores de escritorio AMD Socket AM5 Ryzen 7000 Series, 4 x ranuras de memoria DDR5 / maximo de 128GB, Almacenamiento 4 x M.2 Key-M slots / 4 x SATA 6Gb/s, Sonido ROG SupremeFX 7.1 Surround Sound High Definition Audio CODEC ALC4080, 1 x Intel 2.5Gbps Ethernet (RJ-45), WLAN Wi-Fi 6E 2x2 (802.11 a/b/g/n/ac/ax) / 2.4/5GHz + Bluetooth v5.2, Formato ATX.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/f/c/fc07480f1364d6d3d2d4ba289b7e364c_2.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('1', 'ASUS', 'MOTHERBOARD ASUS ROG STRIX B650-A GAMING WIFI, CHIPSET AMD B650, SOCKET AMD AM5, ATX', '1280.00', 'Motherboard ASUS ROG STRIX B650-A GAMING WIFI, Chipset AMD B650, Socket AMD AM5, ATX Soporta Procesadores de escritorio AMD Socket AM5 Ryzen 7000 Series, 4 x ranuras de memoria DDR5 / maximo de 128GB, Almacenamiento 3 x M.2 Key-M slots / 4 x SATA 6Gb/s, Sonido ROG SupremeFX 7.1 Surround Sound High Definition Audio CODEC ALC4080, 1 x Intel 2.5Gbps Ethernet (RJ-45), WLAN Wi-Fi 6E (802.11 a/b/g/n/ac/ax) / 2.4/5GHz + Bluetooth v5.2, Formato ATX.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/7/2/72b10f5d68e29beca7daf459808d7884_3.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('1', 'MSI', 'MOTHERBOARD MSI PRO Z790-A MAX WIFI, CHIPSET INTEL Z790, LGA1700, HDMI, DP, ATX', '1240.00', 'Motherboard MSI PRO Z790-A MAX WIFI, Chipset Intel Z790, LGA1700, HDMI, DP, ATX Soporta Procesadores de 14ava, 13ava y 12ava Generacion Intel Core i9 / i7 / i5 / i3 / Pentium Gold / Celeron, 4 x ranuras de memoria DDR5 / maximo de 192GB, Almacenamiento 4 x M.2 PCIe 4.0 x4 / 6 x SATA 6Gb/s, Audio: Chipset Realtek ALC4080 Codec / 7.1-Channel Audio HD, 1 x Realtek 2.5Gbps LAN (RJ-45), WLAN Intel Wi-Fi 7 (802.11 a/b/g/n/ac/ax/be) + 2.4/5/6GHz + Bluetooth 5.4, Formato ATX.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/9/8/98c19c652a995add6b7cc85714fbdbfe_2.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('1', 'ASUS', 'MOTHERBOARD ASUS TUF GAMING B550-PLUS WIFI II, CHIPSET AMD B550, SOCKET AMD AM4, ATX', '790.00', 'Motherboard ASUS TUF GAMING B550-PLUS WIFI II, Chipset AMD B550, Socket AMD AM4, ATX Soporta Procesadores AMD Ryzen 5000 Series/ 5000 G-Series/ 4000 G-Series/ 3000 Series/ 3000 G-Series, 4 x ranuras de memoria DDR4 / soportando hasta 128 GB, Almacenamiento: 2 x M.2 Key-M slots / 6 x SATA 6Gb/s, Sonido: ALC887/897 / Realtek 7.1 Surround Sound High Definition Audio CODEC, 1 x Realtek RTL8125B 2.5Gb Ethernet (RJ-45), WLAN Intel Wi-Fi 6 AX200 2x2 (802.11a/b/g/n/ac/ax) soporta 1024QAM/OFDMA/MU-MIMO / Bandas: 2.4/5 GHz / Bluetooth v5.2, Formato ATX.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/a/f/afb58d60c1adc8d22a9cca938ff60a72_2.jpg');

INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('2', 'AMD', 'PROCESADOR AMD RYZEN 5 4600G, 3.70 / 4.20GHZ, 8MB L3, 6 CORE, AM4, 7NM, 65W.', '416.00', 'Procesador AMD Ryzen 5 4600G, 3.70 / 4.20GHz, 8MB L3, 6 Core, AM4, 7nm, 65W.', 'https://www.aibitech.com/79261-medium_default/procesador-amd-ryzen-5-4500-36-41-ghz-8mb-l3-6-core-am4-7nm-65w.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('2', 'AMD', 'PROCESADOR AMD RYZEN 5 4500, 3.6 / 4.1 GHZ, 8MB L3, 6-CORE, AM4, 7NM, 65W.', '331.00', 'Procesador AMD Ryzen 5 4500, 3.6 / 4.1 GHz, 8MB L3, 6-Core, AM4, 7nm, 65W. No incluye controlador de video. Incluye fan cooler.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/0/8/08046f11276ba61925307eb7a97ff4ed_24.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('2', 'INTEL', 'PROCESADOR INTEL CORE I3-12100 3.3 / 4.3GHZ 12MB INTEL SMART CACHÉ, LGA1700, INTEL 7(10NM)', '526.00', 'Procesador Intel Core i3-12100 3.3 / 4.3GHz 12MB Intel Smart Caché, LGA1700, Intel 7(10nm) Incluye Controlador Grafico Intel UHD Graphics 730 / Incluye Fan-Cooler.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/8/b/8be4cc41e206ea97631e4306ac3573ad_18.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('2', 'AMD', 'PROCESADOR AMD RYZEN 7 5700X, 3.40 / 4.60GHZ, 32MB L3 CACHE, 8-CORE, AM4, 7NM, 65W.', '1083.00', 'Procesador AMD Ryzen 7 5700X, 3.40 / 4.60GHz, 32MB L3 Cache, 8-Core, AM4, 7nm, 65W. No incluye Controlador Grafico Presentacion en Caja / No incluye Fan-Cooler.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/f/b/fbec688903f1d30b0c5c85068064bcba_12.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('2', 'AMD', 'PROCESADOR AMD RYZEN 5 5600, 3.50 / 4.40 GHZ, 32MB L3 CACHE, 6-CORES, AM4, 7NM, 65W.', '727.00', 'Procesador AMD Ryzen 5 5600, 3.50 / 4.40 GHz, 32MB L3 Cache, 6-Cores, AM4, 7nm, 65W. No incluye Controlador Grafico Integrado.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/3/e3e44981f6cdc6e919856547794e975f_24.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('2', 'AMD', 'PROCESADOR AMD RYZEN 5 5500, 3.60 / 4.20 GHZ, 16MB L3 CACHE, 6-CORES, AM4, 7NM, 65W.', '416.00', 'Procesador AMD Ryzen 5 5500, 3.60 / 4.20 GHz, 16MB L3 Cache, 6-Cores, AM4, 7nm, 65W. No incluye Controlador Grafico Integrado.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/d/4/d4134f95e8c8857679c742c700717900_22.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('2', 'AMD', 'PROCESADOR AMD RYZEN 5 PRO 4650G, 3.70 / 4.20GHZ, 8MB L3, 6-CORE, AM4, 7NM, 65W.', '642.00', 'Procesador AMD Ryzen 5 PRO 4650G, 3.70 / 4.20GHz, 8MB L3, 6-Core, AM4, 7nm, 65W. Incluye Controladora de video: Radeon Graphics / Incluye Fan-Cooler. Presentacion OEM. (Caja Marron)', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/3/a/3a0da3d0d33b9d2c4b50f74fbf0f9870_7.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('2', 'INTEL', 'PROCESADOR INTEL CORE I7-12700 2.10/4.90GHZ, 25MB SMARTCACHÉ, LGA1700, 180W, INTEL 7(10NM)', '1344.00', 'Procesador Intel Core i7-12700 2.10/4.90GHz, 25MB SmartCaché, LGA1700, 180W, Intel 7(10nm) Incluye Fan Cooler / incluye Controlador Grafico de Video.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/5/4/54ffefb567c432172a82b3a2fada5af9_7.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('2', 'INTEL', 'PROCESADOR INTEL CORE I7-12700F, 2.10 / 4.90GHZ, 25MB SMARTCACHÉ, LGA1700, INTEL 7(10NM)', '1213.00', 'Procesador Intel Core i7-12700F, 2.10 / 4.90GHz, 25MB SmartCaché, LGA1700, Intel 7(10nm) Incluye Fan Cooler / No incluye Controlador Grafico de Video.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/7/e/7ecaab40413587c8178a5a8b783cdcc1_14.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('2', 'INTEL', 'PROCESADOR INTEL CORE I5-12400, 2.50/4.40GHZ 18MB SMARTCACHÉ, LGA1700, 117W, INTEL 7(10NM)', '745.00', 'Procesador Intel Core i5-12400, 2.50/4.40GHz 18MB SmartCaché, LGA1700, 117W, Intel 7(10nm) Incluye Fan Cooler / Incluye Controlador Grafico de Video.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/c/1/c1ab7314bb8a33b88c7436dfbffc2cb9_7.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('2', 'INTEL', 'PROCESADOR INTEL CORE I9-12900 2.40 / 5.10GHZ 30 MB INTEL SMART CACHÉ LGA1700, 65W/202W', '1950.00', 'Procesador Intel Core i9-12900 2.40 / 5.10GHz 30 MB Intel Smart Caché LGA1700, 65W/202W Incluye Controlador Grafico / incluye Fan-Cooler.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/4/b/4b0800b50b5bd0aa7bfc55f8c3ad49d3_5.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('2', 'INTEL', 'PROCESADOR INTEL CORE I7-11700KF 3.60 / 5.00 GHZ, 16 MB CACHÉ L3, LGA1200, 125W, 14 NM.', '480.00', 'Procesador Intel Core i5-10400F, 2.90 GHz, 12 MB Caché L3, LGA1200, 65W, 14 nm. No incluye procesador graficoTecnologías: Compatible con Intel Optane, Turbo Boost 2.0, Secure Key, Virtualización (VT-x)(VT-d). Presentación en caja.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/0/e0a20c4c2eec32426502ecf78a111c0f_20.jpg');

INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('3', 'ASUS', 'TARJETA DE VIDEO ASUS PHOENIX GEFORCE RTX 3060 V2 12GB GDDR6, PCI EXPRESS 4.0', '1440.00', 'Tarjeta de video ASUS Phoenix GeForce RTX 3060 V2 12GB GDDR6, PCI Express 4.0 Puertos: 3 x DisplayPort (Nativo) / 1 x HDMI (Nativo)', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/c/3/c3728635f52ff771804c2eca519bfe2c.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('3', 'ASUS', 'TARJETA DE VIDEO ASUS DUAL GEFORCE GTX 1650 4GB GDDR6 EVO, PCI EXPRESS 3.0', '710.00', 'Tarjeta de video ASUS Dual GeForce GTX 1650 4GB GDDR6 EVO, PCI Express 3.0 Puertos: 1 x DisplayPort (Nativo) / 1 x HDMI (Nativo) / 1 x DVI-D (Nativo)', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/2/a/2a7c8694b81c092d99970e3504765d6a_2.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('3', 'MSI', 'TARJETA DE VIDEO MSI GEFORCE GTX 1650 D6 VENTUS XS OCV3, 4GB GDDR6, PCIE GEN 3.0 X16', '655.00', 'Tarjeta de video MSI GeForce GTX 1650 D6 VENTUS XS OCV3, 4GB GDDR6, PCIe Gen 3.0 x16 Puertos: 1 x DisplayPort / 1 x HDMI / 1 x DL-DVI-D', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/5/b/5b8a6cf0b32dccfd7de8af0baca4b61e_2.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('3', 'GIGABYTE', 'TARJETA DE VIDEO GIGABYTE GEFORCE RTX 4060 TI AERO OC 16G, 16GB GDDR6, PCI-E 4.0', '2600.00', 'Tarjeta de video Gigabyte GeForce RTX 4060 Ti AERO OC 16G, 16GB GDDR6, PCI-E 4.0 Puertos: 2 x DisplayPort / 2 x HDMI', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/0/0/00852bb03ec6c124e93f4df18e8459c0_2.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('3', 'ASUS', 'TARJETA DE VIDEO ASUS DUAL GEFORCE RTX 4060 OC EDITION 8GB GDDR6 PCI-E 4.0 COLOR BLANCO', '1570.00', 'Tarjeta de video ASUS Dual GeForce RTX 4060 OC Edition 8GB GDDR6 PCI-E 4.0 Color Blanco Puertos: 3 x DisplayPort / 1 x HDMI', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/c/0/c02ce9993ca13cd79ec94e62802bc10d_2.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('3', 'MSI', 'TARJETA DE VIDEO MSI GEFORCE RTX 4060 TI GAMING X SLIM WHITE, 16GB GDDR6, PCIE GEN 4.0 X8', '2500.00', 'Tarjeta de video MSI GeForce RTX 4060 Ti GAMING X SLIM WHITE, 16GB GDDR6, PCIe Gen 4.0 x8 Puertos: 3 x DisplayPort / 1 x HDMI', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/f/1/f184153ddf51db1a3ed84f983f009bfd.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('3', 'MSI', 'TARJETA DE VIDEO MSI GEFORCE GT 1030 4GD4 LP OC, 4GB DDR4, PCIE GEN 3.0 X16 (UTILIZA X4)', '410.00', 'Tarjeta de video MSI GeForce GT 1030 4GD4 LP OC, 4GB DDR4, PCIe Gen 3.0 x16 (Utiliza x4) Puertos: 1 x DisplayPort / 1 x HDMI', 'https://http2.mlstatic.com/D_NQ_NP_628019-MPE73215768402_122023-O.webp');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('3', 'ASUS', 'TARJETA DE VIDEO ASUS ROG STRIX GEFORCE RTX 4070 SUPER 12GB GDDR6X OC EDITION, PCIE 4.0', '3700.00', 'Tarjeta de video ASUS ROG Strix GeForce RTX 4070 SUPER 12GB GDDR6X OC Edition, PCIe 4.0 Puertos: 3 x DisplayPort (Nativo) / 2 x HDMI (Nativo)', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/7/b/7b645096e0d9f4eef6eaafbbd7aefc7a.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('3', 'ASUS', 'TARJETA DE VIDEO ASUS TUF GAMING GEFORCE RTX 4070TI SUPER 16GB GDDR6X OC EDITION, PCIE 4.0', '4200.00', 'Tarjeta de video ASUS TUF Gaming GeForce RTX 4070Ti SUPER 16GB GDDR6X OC Edition, PCIe 4.0 Puertos: 3 x DisplayPort (Nativo) / 2 x HDMI (Nativo)', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/b/d/bd64113c0d62f63a305c4716c397ce18.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('3', 'MSI', 'VGA 16G MS RTX4080SUP GMG SLIM', '5350.00', 'VGA 16G MS RTX4080SUP GMG SLIM', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/7/6/76f114fb54b903ee1e74edf9c623b0d3.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('3', 'GIGABYTE', 'VGA 8G GB RX7600 GAMING OC GD6', '1320.00', 'VGA 8G GB RX7600 GAMING OC GD6', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/8/4/8498d70ebf2809a8b43b94cc9bf47129.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('3', 'GIGABYTE', 'TARJETA DE VIDEO GIGABYTE GEFORCE RTX 4090 GAMING OC 24G, 24GB GDDR6X, PCI-E 4.0X16', '8900.00', 'Tarjeta de video Gigabyte GeForce RTX 4090 GAMING OC 24G, 24GB GDDR6X, PCI-E 4.0x16 Puertos: 3 x DisplayPort / 1 x HDMI', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/0/f/0f9b94cb5827673a4d6fc31501f47332.jpg');

INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('4', 'TEAMGROUP', 'MEMORIA TEAMGROUP DELTA TUF GAMING ALLIANCE RGB, 16GB DDR5-5200MHZ PC5-41600, CL40, 1.25V', '250.00', 'Memoria TEAMGROUP DELTA TUF Gaming Alliance RGB, 16GB DDR5-5200MHz PC5-41600, CL40, 1.25V', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/b/e/be69f7d5936b3ebd4b36921058019b5e_3.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('4', 'KINGSTON', 'MEMORIA DIMM KINGSTON FURY BEAST WHITE, 16GB DDR5-5200MHZ PC5-41600, CL40, 1.25V, NON-ECC', '260.00', 'Memoria DIMM Kingston FURY Beast White, 16GB DDR5-5200MHz PC5-41600, CL40, 1.25V, Non-ECC', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/7/5/75374d530c39bf6b2c954ad514c013e1_6.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('4', 'KINGSTON', 'MEMORIA KINGSTON FURY BEAST 32GB DDR5-5200MHZ, PC5-41600, CL40, 1.25V, 288-PIN, NON-ECC', '490.00', 'Memoria Kingston Fury Beast 32GB DDR5-5200MHz, PC5-41600, CL40, 1.25V, 288-Pin, Non-ECC', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/f/ef731124620c6a0928909d41769cd2c5.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('4', 'KINGSTON', 'MEMORIA DIMM KINGSTON FURY BEAST WHITE EXPO, 16GB DDR5-5200MHZ PC5-41600, CL36, 1.25V', '260.00', 'Memoria DIMM Kingston FURY Beast White EXPO, 16GB DDR5-5200MHz PC5-41600, CL36, 1.25V', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/3/1/3195c72e04ee4ccef7daa5d35f756b7d_3.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('4', 'TEAMGROUP', 'MEM RAM 16G TF VULC SOD 5.20GZ', '220.00', 'MEM RAM 16G TF VULC SOD 5.20GZ', 'https://gpperu.com/img/datasheet/ME16TFVS5200HC3_LARGE.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('4', 'KINGSTON', 'MEMORIA KINGSTON FURY BEAST WHITE RGB, 16GB DDR5-5200 MHZ, CL-40, 1.25V, WHITE', '285.00', 'Memoria Kingston FURY Beast White RGB, 16GB DDR5-5200 MHz, CL-40, 1.25V, White', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/2/3/23c6d57e6c203ce1ebaa8d01673348ee_4.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('4', 'TEAMGROUP', 'MEMORIA TEAMGROUP T-FORCE VULCAN Z DDR4, 32GB DDR4-3200MHZ, CL-16, 1.35V, GRIS.', '305.00', 'Memoria TEAMGROUP T-FORCE VULCAN Z DDR4, 32GB DDR4-3200MHz, CL-16, 1.35V, Gris.', 'https://imagenes.deltron.com.pe/images/productos/on-line/items/large/me/32/me32gtfvz3200dg.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('4', 'TEAMGROUP', 'MEMORIA TEAMGROUP T-FORCE DELTA RGB, 32GB DDR4-3200MHZ, CL-16, 1.35V, NEGRO.', '330.00', 'Memoria TEAMGROUP T-Force Delta RGB, 32GB DDR4-3200MHz, CL-16, 1.35V, Negro.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/2/d/2d9e5c42ae111cdb14050de3e81790ca_8.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('4', 'TEAMGROUP', 'MEMORIA TEAMGROUP T-FORCE DELTA RGB DDR5, 16GB DDR5-5200MHZ, PC5-41600, CL40, 1.25V', '245.00', 'Memoria TEAMGROUP T-FORCE DELTA RGB DDR5, 16GB DDR5-5200MHz, PC5-41600, CL40, 1.25V', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/a/0/a0928a9184994cb4328426233d57b8a5_3.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('4', 'TEAMGROUP', 'MEMORIA TEAMGROUP T-FORCE DELTA RGB DDR5 16GB DDR5-5200 MHZ, CL40, 1.25V', '245.00', 'Memoria TEAMGROUP T-Force DELTA RGB DDR5 16GB DDR5-5200 MHz, CL40, 1.25V', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/5/8/58e298b382591b12422dd0d78460eee9_4.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('4', 'KINGSTON', 'MEMORIA DIMM KINGSTON FURY RENEGADE 8GB DDR4-3600MHZ PC4-28800, CL16, 1.35V, 288-PIN, RGB', '150.00', 'Memoria DIMM Kingston Fury Renegade 8GB DDR4-3600MHz PC4-28800, CL16, 1.35V, 288-pin, RGB', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/2/8/283ce0f75d698713d7e6b0bf983e4ac3_1.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('4', 'KINGSTON', 'MEMORIA KINGSTON FURY BEAST 32GB DDR4-3200MHZ PC4-25600, CL16, 1.35V, 288-PIN, RGB, DIMM', '370.00', 'Memoria Kingston Fury Beast 32GB DDR4-3200MHz PC4-25600, CL16, 1.35V, 288-Pin, RGB, DIMM', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/b/7/b7c3a39b147d72dcb054c85a9efb7e11_3.jpg');

INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('5', 'CORSAIR', 'EL TECLADO MECÁNICO DE JUEGO CORSAIR K60 RGB PRO LOW PROFILE - CHERRY MX LOW PROFILE SPEED', '340.00', 'El teclado mecánico de juego CORSAIR K60 RGB PRO LOW PROFILE - CHERRY MX Low Profile Speed El teclado mecánico de juego CORSAIR K60 RGB PRO LOW PROFILE se ha diseñado pensando en el estilo y la consistencia, con una estructura de aluminio cepillado duradera y fina, interruptores mecánicos CHERRY MX Low Profile SPEED y retroiluminación RGB brillante en cada tecla. Conectividad: USB 3.0 or 3.1 Tipo-A', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/k/b/kbcor910d018sp.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('5', 'CORSAIR', 'TECLADO MECÁNICO PARA JUEGOS K60 PRO - LED ROJO. INTERRUPTORES 100% - CHERRY MV - NEGRO', '275.00', 'Teclado mecánico para juegos K60 PRO - LED rojo. Interruptores 100% - CHERRY MV - Negro El teclado mecánico para juegos CORSAIR K60 PRO se ha diseñado con una estructura de aluminio cepillado duradera e interruptores de teclas CHERRY MV que permiten que reluzca la brillante retroiluminación LED roja en cada tecla. Conectividad: USB 2.0 Tipo-A.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/k/b/kbcor910d029sp.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('5', 'CORSAIR', 'TECLADO MECÁNICO PARA JUEGOS CORSAIR K70 RGB MK.2 SE - CHERRY MX SPEED', '585.00', 'Teclado mecánico para juegos Corsair K70 RGB MK.2 SE - CHERRY MX Speed El CORSAIR K70 RGB MK.2 SE es un teclado mecánico premium para juegos diseñado para durar, con una estructura de aluminio plateado, interruptores CHERRY MX Speed, teclas de doble moldeado y una increíble retroiluminación dinámica RGB por tecla.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/2/0/203a0897076bf4a13c396d2a36a4e015_7.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('5', 'CORSAIR', 'TECLADO DE ENTRETENIMIENTO CORSAIR K83 WIRELESS', '385.00', 'Teclado de entretenimiento Corsair K83 Wireless El teclado de entretenimiento K83 Wireless ofrece lo último en control multimedia para la sala de estar. El diseño de aluminio, la retroiluminación blanca y la tecnología inalámbrica flexible le brindan un asiento de primera fila para el entretenimiento de su sala de estar. Conectividad: 2.4GHz Wireless, Bluetooth 4.2, USB 2.0 o 3.0 Tipo-A.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/3/f/3f27f906701c1f3f45a06682f7c73534_6.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('5', 'CORSAIR', 'TECLADO INALAMBRICO PARA JUEGOS CORSAIR K57 RGB WIRELESS', '330.00', 'Teclado Inalambrico para juegos Corsair K57 RGB WIRELESS Ilumine sus partidas en modo inalámbrico con el teclado de juego K57 RGB Wireless, con tecnología SLIPSTREAM WIRELESS de menos de 1 ms y una retroiluminación RGB brillante en cada tecla con LED CAPELLIX. Tres modos de conexion: TECNOLOGÍA SLIPSTREAM CORSAIR WIRELESS / BLUETOOTH / CABLE USB.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/3/c/3c34fedfac6ddb2799f3b28e6a336667_6.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('5', 'CORSAIR', 'TECLADO MECÁNICO PARA JUEGO CORSAIR STRAFE RGB MK.2 CHERRY MX RED (SP), USB 2.0', '375.00', 'Teclado mecánico para juego Corsair STRAFE RGB MK.2 CHERRY MX Red (SP), USB 2.0 El teclado mecánico CORSAIR STRAFE RGB MK.2 de última generación incorpora interruptores 100 % CHERRY MX RGB y 8 MB de almacenamiento interno de perfiles para llevar sus perfiles de juegos donde quiera que vaya.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/9/c/9c78fd4bc6dadf2eeba6a007a03fe8f0_10.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('5', 'CORSAIR', 'TECLADO MECÁNICO PARA JUEGOS CORSAIR K95 RGB PLATINUM XT  CHERRY MX SPEED (NA LAYOUT)', '635.00', 'Teclado mecánico para juegos Corsair K95 RGB PLATINUM XT  CHERRY MX SPEED (NA Layout) El teclado mecánico para juegos CORSAIR K95 RGB PLATINUM XT sumerge su escritorio en una iluminación RGB dinámica con iluminación en cada tecla, equipado con un conjunto de teclas PBT de gran duración y seis teclas macro exclusivas con integración del software Elgato Stream Deck. Conectividad: 2 x USB 3.0 o 3.1 Tipo-A', 'https://ezpc.pe/wp-content/uploads/2022/07/CH-9109014-SP-430x430.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('5', 'TEROS', 'TECLADO MULTIMEDIA TEROS, TE-4067S,USB 2.0, NEGRO', '21.00', 'Teclado multimedia Teros, TE-4067S,USB 2.0, Negro 3 luces indicadoras color verde: Bloqueo numérico/Bloqueo de mayúsculas/Bloqueo de desplazamiento', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/f/c/fc9004499035329d0e5c3ab7b919685b_8.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('5', 'TEROS', 'TECLADO INALAMBRICOTEROS TE-4066G, MULTIMEDIA, CON ILUMINACIÓN RGB BACKLIT', '60.00', 'Teclado inalambricoTeros TE-4066G, multimedia, con iluminación RGB backlit', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/a/2/a23b2dbe9265dd75eafee0b5d2cc2dec_12.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('5', 'TEROS', 'TECLADO GAMER TEROS TE-4153, MECÁNICO, MULTIMEDIA, ILUMINACIÓN RGB, TKL, USB.', '94.00', 'Teclado Gamer Teros TE-4153, mecánico, multimedia, iluminación RGB, TKL, USB. Materiales ABS de alta calidad, Teclas completas anti-ghosting, Teclas de doble inyección, Función de bloqueo Win, Retroiluminación RGB', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/f/5/f51bd10684f18f4dd05a80d81cebd3d2_15.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('5', 'TEROS', 'TECLADO GAMER TEROS TE-4152, MECÁNICO, MULTIMEDIA, ILUMINACIÓN RGB, 105 TECLAS, USB.', '115.00', 'Teclado Gamer Teros TE-4152, mecánico, multimedia, iluminación RGB, 105 teclas, USB. Materiales ABS de alta calidad, Teclas completas anti-ghosting, Teclas de doble inyección, Función de bloqueo Win, Retroiluminación RGB', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/4/6/46c4ca9a6bd1cccb0225b39b438e7e9c_13.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('5', 'TEROS', 'TECLADO TEROS, TE-4065N, SELLADO, LAVABLE, A PRUEBA DE AGUA, IPX7, USB, NEGRO', '50.00', 'Teclado Teros, TE-4065N, Sellado, Lavable, A prueba de agua, IPX7, USB, Negro IPX7 - Se puede sumergir el dispositivo en el agua sin temor de que se estropee, siempre que el tiempo de inmersión no supere la media hora y no lo hunda más de un metro.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/a/9/a9c557fc7d72193be1ac5e18495c2800_12.jpg');

INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('6', 'TEROS', 'DIMENSIONES 450*400*3 MM', '11.00', 'Dimensiones 450*400*3 mm', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/a/d/ad860e1bc21bc766b283f948ef152425.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('6', 'TEROS', 'MOUSE ÓPTICO INALÁMBRICO TEROS TE5075Y, COLOR NEGRO / AMARILLO, 1600 DPI, RECEPTOR USB.', '12.00', 'Mouse óptico inalámbrico Teros TE5075Y, color Negro / Amarillo, 1600 dpi, receptor USB. 4 botones, tecnología inalámbrica 2.4GHz, presentación en colgador.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/b/eb1a874b3544b6f0a4f04cc7c720ffce_8.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('6', 'TEROS', 'MOUSE ÓPTICO TEROS TE-5076N, 1600DPI, , USB, 4 BOTONES,', '12.00', 'Mouse óptico Teros TE-5076N, 1600dpi, , USB, 4 botones,', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/2/e/2ed71d500688ab25881cdcc1bcacb237_8.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('6', 'TEROS', 'MOUSE ÓPTICO TEROS TE-5162N, 6400DPI, RGB, USB, 6 BOTONES, PRESENTACIÓN EN COLGADOR', '23.00', 'Mouse óptico Teros TE-5162N, 6400dpi, RGB, USB, 6 botones, presentación en Colgador Diseño ergonómico con superficie antideslizante, cambios de velocidad, diferentes colores de iluminación', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/7/3/73e5bacb86559fb750e604b3c0b733b1_14.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('6', 'TEROS', 'MOUSE ÓPTICO TEROS TE-5164N, 6400DPI, RGB, USB, 7 BOTONES, PRESENTACIÓN EN COLGADOR', '27.00', 'Mouse óptico Teros TE-5164N, 6400dpi, RGB, USB, 7 botones, presentación en Colgador Diseño ergonómico con superficie antideslizante, cambios de velocidad, diferentes colores de iluminación', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/t/e/te-5164.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('6', 'CORSAIR', 'MOUSE PAD GAMING CORSAIR MM800 POLARIS RGB, 26.00 X 35.00 CM, 5 MM, USB.', '195.00', 'Mouse Pad Gaming Corsair MM800 Polaris RGB, 26.00 x 35.00 cm, 5 mm, USB. Puerto USB libre, nuevo nivel de inmersión Led, combina una superficie de microtextura de fricción baja con una amplia área de acción para ofrecer un seguimiento preciso al píxel sin importar el estilo de juego, 15 zonas RGB individuales incluyen la verdadera tecnología de iluminación PWM para representar el color con la mayor precisión, sincronice cada una de las zonas de iluminación con otros productos RGB gracias al software CUE, y complete así la configuración definitiva para juegos.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/3/4/34c8a4346c9369dc176a2e091213fc98_16.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('6', 'CORSAIR', 'MOUSE ÓPTICO CORSAIR M65 RGB ELITE FPS GAMING, 18 000 DPI, USB, 9 BOTONES, NEGRO.', '205.00', 'Mouse óptico Corsair M65 RGB Elite FPS Gaming, 18 000 dpi, USB, 9 botones, Negro. Sensor óptico Pixart PMW3391 de hasta 18000 DPI, 2 zonas con iluminación RGB, cable de 1.8 mts, botón lateral optimizado sniper, ideal para juegos de tipo FPS.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/3/1/318bc0453441209ddc262ad60ff4363c_15.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('6', 'CORSAIR', 'MOUSE ÓPTICO CORSAIR M65 RGB ELITE FPS GAMING, 18 000 DPI, USB, 9 BOTONES, BLANCO.', '205.00', 'Mouse óptico Corsair M65 RGB Elite FPS Gaming, 18 000 dpi, USB, 9 botones, blanco. Sensor óptico Pixart PMW3391 de hasta 18 000 dpi, 2 zonas con iluminación RGB, cable de 1.8 mts, botón lateral optimizado sniper, ideal para juegos de tipo FPS.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/6/6/665864ccbbc1099b9385fc63a947fe7a_14.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('6', 'CORSAIR', 'MOUSE ÓPTICO CORSAIR IRONCLAW RGB GAMING, 18 000 DPI, 7 BOTONES, NEGRO, USB.', '205.00', 'Mouse óptico Corsair Ironclaw RGB Gaming, 18 000 dpi, 7 botones, Negro, USB. Sensor óptico Pixart PMW3391 de hasta 18 000 DPI, 1 zona con iluminación RGB, para juegos tipo FPS, moba, cable de 1.8 mts', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/7/0/7081077f327ad023fe45e41dfb229b7b_15.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('6', 'CORSAIR', 'MOUSE GAMER CORSAIR GLAIVE RGB PRO, ALUMÍNIO.', '225.00', 'Mouse gamer Corsair GLAIVE RGB PRO, Alumínio. El mouse gamer CORSAIR GLAIVE RGB PRO combina un alto diseño con mucho confort, proyectado con un formato ergonómico ideal para largas sesiones de juegos y un sensor óptico de 18.000 DPI de ultra precisión diseñado para juegos. Conectividad: USB 2.0.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/5/1/51z2tj6ln_l._ac_ss450_.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('6', 'TEROS', 'MOUSE GAMER TE-1210G DISEÑO DEL AGUJERO MEJOR RATÓN PARA JUEGOS CON CABLE', '47.00', 'Mouse gamer TE-1210G diseño del agujero mejor ratón para juegos con cable', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/c/6/c69f90127c995872f8d3134b5baddad7_9.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('6', 'CORSAIR', 'MOUSE PARA JUEGOS CORSAIR INALÁMBRICO DARK CORE RGB PRO', '275.00', 'Mouse para juegos Corsair inalámbrico DARK CORE RGB PRO El CORSAIR DARK CORE RGB PRO le ayuda a ganar sin cables, y cuenta con el sistema SLIPSTREAM WIRELESS de menos de 1 ms, un sensor óptico personalizado de 18.000 ppp optimizado para ratones inalámbricos y la tecnología de sondeo avanzada a un máximo de 2.000 Hz. Conectividad: USB 2.0 / Wireless 2.4GHz.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/9/4/943d81c601e1c07b6080298122bc4d37_8.jpg');

INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('7', 'CORSAIR', 'FAN CORSAIR SERIES LL140 RGB DUAL LED, 14 CM, 1 600 RPM, 12VDC, 4 PINES.', '99.00', 'Fan Corsair Series LL140 RGB Dual Led, 14 cm, 1 600 RPM, 12VDC, 4 pines. Velocidad de giro 600 - 1 300 RPM, Airflow: 51.5 CFM, presión de aire 1.52 mm-H2O, nivel de ruido: 25 dBA, fan con rodamiento de tipo Hidráulico, iluminación con 2 Led independientes.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/2/1/21e5455c709d34229b8877f478186209_20.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('7', 'CORSAIR', 'FAN CORSAIR ML140 PRO RGB LED, 14 CM, 1200 RPM, 13.2 VDC, 4 PINES, PWM CONTROL.', '99.00', 'Fan Corsair ML140 Pro RGB Led, 14 cm, 1200 RPM, 13.2 VDC, 4 pines, PWM Control. Airflow: 55.4 CFM, presión de aire. 1.27 mm-H2O, nivel de ruido: 20.4 dBA, fan tipo ,Levitaciòn Magnetica.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/0/c/0c6ec73d172e0f6f529863068a737957_17.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('7', 'TEROS', 'CASE GAMER TEROS TE-1173N, MID TOWER, ATX, USB 3.0 / 2.0, AUDIO.', '175.00', 'Case Gamer Teros TE-1173N, Mid Tower, ATX, USB 3.0 / 2.0, Audio. Panel lateral y frontal de vidrio transparente, puertos USB 3.0 x 2, USB 2.0 x 1, Audífono y microfono,3 FAN ARGB. No incluye fuente de alimentación.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/b/ebf5a30ca300d018e7ed8b6959b98bac_3.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('7', 'TEROS', 'CASE GAMER TEROS TE1174N, MID TOWER, NEGRO, USB 3.0, USB 2.0, AUDIO.', '185.00', 'Case Gamer Teros TE1174N, Mid Tower, Negro, USB 3.0, USB 2.0, Audio. Panel lateral Vidrio transparente, puertos USB 3.0 x 2, USB 2.0 x 1, Audífono y microfono, fan posterior y frontis 12 cm ARGB. No incluye fuente de alimentación.', 'https://http2.mlstatic.com/D_NQ_NP_966936-MPE72955719649_112023-O.webp');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('7', 'MSI', 'CASE GAMER MSI MAG FORGE M100A', '190.00', 'Case Gamer MSI MAG FORGE M100A Motherboard - Factor de Forma soportados: Micro-ATX / Mini-ITX', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/1/d/1dd587d6d9741aa7046de08846fcfd6f_3.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('7', 'TEROS', 'CASE GAMER TEROS TE1172N, MID TOWER, NEGRO, USB 3.0, USB 2.0, AUDIO.', '245.00', 'Case Gamer Teros TE1172N, Mid Tower, Negro, USB 3.0, USB 2.0, Audio. Panel lateral Vidrio transparente, puertos USB 3.0 x 2, USB 2.0 x 1, Audífono y microfono, fan posterior y frontis 12 cm ARGB. No incluye fuente de alimentación.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/8/3/835a947c0602c1c3b6703d472afd5227_3.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('7', 'TEROS', 'CASE GAMER TEROS TE1163N, NEGRO, USB 3.0, USB 2.0, AUDIO FAN ARGB', '260.00', 'Case Gamer Teros TE1163N, Negro, USB 3.0, USB 2.0, Audio fan ARGB Panel lateral Vidrio templado, puertos USB 3.0 , USB 2.0, Audífono y microfono, 4 Fan 12 cm ARGB. No incluye fuente de alimentación.', 'https://falabella.scene7.com/is/image/FalabellaPE/gsc_125854026_4353830_1?wid=800&hei=800&qlt=70');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('7', 'TEROS', 'CASE GAMER TEROS TE-1165N, MID TOWER, NEGRO, USB 3.0 / 2.0, AUDIO.', '270.00', 'Case Gamer Teros TE-1165N, Mid Tower, NEGRO, USB 3.0 / 2.0, Audio. Panel lateral de vidrio transparente, puertos USB 3.0 x 2, USB 2.0 x 2, Audífono y microfono,7 FAN ARGB. No incluye PSU', 'https://www2.computo.com.pe/storage/products/9d4d7e06e476da8942df3ea40d8db68801c323a0.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('7', 'GIGABYTE', 'CASE GIGABYTE C200 GLASS, MID TOWER, ATX, RGB, USB 3.0, NO INCLUYE FUENTE DE PODER', '345.00', 'Case gigabyte C200 Glass, Forma Mid tower, Tipo mini-ITX/m-ATX/ATX, Iluminación RGB, USB 3.0 *2, RGB LED Switch, Botón de Reset, Entrada y salida de audio (Supports AC97 / HD Audio). No incluye fuente de poder. Compatible con refrigeración líquida.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/5/e5726fbad11112bcd08635999254fbea_2.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('7', 'ASUS', 'CASE ASUS TUF GAMING GT502, MID-TOWER, ATX, BLANCO.', '780.00', 'Case ASUS TUF Gaming GT502, Mid-Tower, ATX, Blanco. Puertos: 1 x USB 3.2 Gen 2 Tipo-C / 2 x USB 3.2 Gen 1 / 1 x Headphone/Microphone / LED Control Button. Ventiladores Pre-instalados: No incluyen.No incluye fuente de alimentación / Panel frontal/lateral de vidrio transparente.', 'https://falabella.scene7.com/is/image/FalabellaPE/gsc_123193326_3601301_1?wid=800&hei=800&qlt=70');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('7', 'TEROS', 'CASE TEROS TE1076N, MID TOWER, ATX, 250W, USB 3.0 / 2.0, AUDIO, NEGRO.', '92.00', 'Case Teros TE1076N, Mid Tower, ATX, 250W, USB 3.0 / 2.0, Audio, Negro. 1 conector 24/20 pines, 1 conector EPS 12V 4 pines, 2 conectores SATA, 2 conectores periféricos, USB 2.0 x 2 , USB 3.0 x 1, Audífono y microfono, fan posterior 8 cm.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/7/d/7dcd95ba05bcbb6a515ee07159605c03_6.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('7', 'TEROS', 'CASE TEROS TE1075N, MID TOWER, ATX, 250W, USB 3.0 / 2.0, AUDIO, NEGRO.', '100.00', 'Case Teros TE1075N, Mid Tower, ATX, 250W, USB 3.0 / 2.0, Audio, Negro. 1 conector 24/20 pines, 1 conector EPS 12V 4 pines, 2 conectores SATA, 2 conectores periféricos, USB 2.0 x 1 , USB 3.0 x 1, Audífono y microfono, fan posterior 8 cm.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/6/4/647c6bfbdf3a01dfe7626ed986b718f3_5.jpg');

INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('8', 'KINGSTON', 'UNIDAD EN ESTADO SOLIDO KINGSTON FURY RENEGADE 500GB, M.2 2280 PCIE 4.0 NVME.', '330.00', 'Unidad en estado solido Kingston FURY Renegade 500GB, M.2 2280 PCIe 4.0 NVMe. Velocidad de escritura 3900 MB/s, Velocidad de lectura 7300 MB/s, Controlador Phison E18, NAND 3D TLC. Dimensiones: 8.00 cm x 2.20 cm x 0.22 cm / Peso: 7 gr.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/0/4/047c9cb69a3ce30add84a71920b512f5_5.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('8', 'KINGSTON', 'UNIDAD EN ESTADO SOLIDO KINGSTON FURY RENEGADE 1TB, M.2 2280 PCIE 4.0 NVME.', '540.00', 'Unidad en estado solido Kingston FURY Renegade 1TB, M.2 2280 PCIe 4.0 NVMe. Velocidad de escritura 6000 MB/s, Velocidad de lectura 7300 MB/s, Controlador Phison E18, NAND 3D TLC. Dimensiones: 8.00 cm x 2.20 cm x 0.22 cm / Peso: 7 gr.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/7/1/71b879bc93e99e5a948cb0dc79116928_4.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('8', 'KINGSTON', 'UNIDAD EN ESTADO SOLIDO KINGSTON KC3000, 4096GB, M.2 2280 PCIE GEN 4.0 NVME', '1730.00', 'Unidad en estado solido Kingston KC3000, 4096GB, M.2 2280 PCIe Gen 4.0 NVMe Velocidad de escritura 7000 MB/s, Velocidad de lectura 7000 MB/s, Controlador Phison E18, NAND TLC 3D. Dimensiones: 8.00 cm x 2.20 cm x 0.35 cm / Peso: 9.7 gr.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/6/1/61f890edefbc9918dbf9c40132290f0b_3.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('8', 'KINGSTON', 'UNIDAD EN ESTADO SOLIDO KINGSTON KC3000, 2048GB, M.2 2280 PCIE GEN 4.0 NVME', '790.00', 'Unidad en estado solido Kingston KC3000, 2048GB, M.2 2280 PCIe Gen 4.0 NVMe Velocidad de escritura 7000 MB/s, Velocidad de lectura 7000 MB/s, Controlador Phison E18, NAND TLC 3D. Dimensiones: 8.00 cm x 2.20 cm x 0.35 cm / Peso: 9.7 gr.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/f/9/f97c6c3db41565082b62992f1804aff6_5.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('8', 'KINGSTON', 'UNIDAD EN ESTADO SOLIDO KINGSTON KC3000, 512GB, M.2 2280 PCIE GEN 4.0 NVME', '305.00', 'Unidad en estado solido Kingston KC3000, 512GB, M.2 2280 PCIe Gen 4.0 NVMe Velocidad de escritura 3900 MB/s, Velocidad de lectura 7000 MB/s, Controlador Phison E18, NAND TLC 3D. Dimensiones: 8.00 cm x 2.20 cm x 0.22 cm / Peso: 7 gr.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/c/8/c84501731d1a422906a72074060c48c5_5.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('8', 'KINGSTON', 'UNIDAD EN ESTADO SOLIDO KINGSTON KC600, 1024GB, SATA REV 3.0 (6 GB/S)', '435.00', 'Unidad en estado solido Kingston KC600, 1024GB, SATA Rev 3.0 (6 Gb/s) Factor de forma: 2.5", Velocidad de escritura 520 MB/s, Velocidad de lectura 550 MB/s, Controlador SM2259, NAND 3D TLC. Dimensiones: 10.01 cm x 6.98 cm x 0.70 cm / Peso: 40 gr', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/3/0/30274ff5b95fdcfa819fd2c5302be6df_5.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('8', 'WESTERN_DIGITAL', 'UNIDAD EN ESTADO SOLIDO WESTERN DIGITAL BLUE SA510, 250GB, SATA 6GB/S, 2.5", 7MM.', '185.00', 'Unidad en estado solido Western Digital Blue SA510, 250GB, SATA 6Gb/s, 2.5", 7mm. Velocidad de escritura 440 MB/s, velocidad de lectura 555 MB/s.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/a/4/a41e479690e6366395c175e6211caa92_9.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('8', 'WESTERN_DIGITAL', 'UNIDAD EN ESTADO SOLIDO WESTERN DIGITAL BLUE SA510, 1TB, SATA 6GB/S, 2.5", 7MM.', '460.00', 'Unidad en estado solido Western Digital Blue SA510, 1TB, SATA 6Gb/s, 2.5", 7mm. Velocidad de escritura 520 MB/s, velocidad de lectura 560 MB/s.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/5/c/5cdf02fc707230c12baee7f1975eea1f_3.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('8', 'WESTERN_DIGITAL', 'UNIDAD DE ESTADO SOLIDO WESTERN DIGITAL GREEN, WDS240G3G0A, 240GB, SATA 6GB/S, 2.5", 7MM.', '120.00', 'Unidad de estado solido Western Digital Green, WDS240G3G0A, 240GB, SATA 6Gb/s, 2.5", 7mm.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/1/6/1606715d5158b3a1bd49f83371d5b4a6_21.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('8', 'WESTERN_DIGITAL', 'UNIDAD DE ESTADO SOLIDO WESTERN DIGITAL GREEN, WDS480G3G0A, 480GB, SATA 6GB/S, 2.5", 7MM.', '180.00', 'Unidad de estado solido Western Digital Green, WDS480G3G0A, 480GB, SATA 6Gb/s, 2.5", 7mm.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/5/f/5f14511cba6c5fdc94e95ca7e4200168_12.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('8', 'WESTERN_DIGITAL', 'DISCO DURO WESTERN DIGITAL RED PLUS WD80EFZZ, 8TB, SATA, 5640RPM, 3.5", CACHE 128MB', '845.00', 'Disco duro Western Digital Red Plus WD80EFZZ, 8TB, SATA, 5640rpm, 3.5", Cache 128MB', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/8/f/8f713f8d87cb30b4ec03cc1c9a336c9f_6.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('8', 'WESTERN_DIGITAL', 'DISCO DURO WESTERN DIGITAL RED PLUS WD20EFZX, 2TB, SATA, 5400RPM, 3.5", CACHE 128MB', '365.00', 'Disco duro Western Digital Red Plus WD20EFZX, 2TB, SATA, 5400rpm, 3.5", Cache 128MB', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/4/a/4afd59069528644575b0d7bfdc7b9d43_13.jpg');

INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('9', 'LG', 'MONITOR GAMING LG 31.5" QHD IPS (2560X1440) 165HZ, HDMI X1, DP X1, HP-OUT X1', '1460.00', 'Monitor Gaming LG 31.5" QHD IPS (2560x1440) 165Hz, HDMI x1, DP x1, HP-Out x1 Relacion de Contraste: 1000:1, Relación de aspecto: 16:9, Brillo: 400 cd/m², Frecuencia de actualización de hasta 165Hz, Tiempo de respuesta: 1ms (GtG at Faster), Consumo de energía (Máx): 55W, Adaptador de poder: 100-240 Vac, 50/60 Hz', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/b/ebe62be37278d74edf96f2f674177e21_4.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('9', 'LG', 'MONITOR GAMING LG 27" ULTRAGEAR, UHD 4K IPS (3840X2160) 144HZ, HDMI X2, DP X1, HP-OUT X1', '2510.00', 'Monitor Gaming LG 27" UltraGear, UHD 4K IPS (3840x2160) 144Hz, HDMI x2, DP x1, HP-Out x1 Relacion de Contraste: 1000:1, Relación de aspecto: 16:9, Brillo: 400 cd/m², Frecuencia de actualización de hasta 144Hz, Tiempo de respuesta: 1ms (GtG), Consumo de energía (Máx): 55W, Adaptador de poder: 100-240 Vac, 50/60 Hz.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/5/9/594fb01c9d9bb6ea39d17063359a73b2_5.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('9', 'LG', 'MONITOR GAMING LG 27" ULTRAGEAR, QHD IPS (2560X1440) 165HZ, HDMI X2, DP X1, HP-OUT X1', '1260.00', 'Monitor Gaming LG 27" UltraGear, QHD IPS (2560x1440) 165Hz, HDMI x2, DP x1, HP-Out x1 Relacion de Contraste: 1000:1, Relación de aspecto: 16:9, Brillo: 300 cd/m², Frecuencia de actualización de hasta 165Hz, Tiempo de respuesta: 1ms (GtG at Faster), Consumo de energía (Máx): 48W, Adaptador de poder: 100-240 Vac, 50/60 Hz.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/b/9/b95817f41a637c8c0cef57bb0efeaa53.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('9', 'LG', 'MONITOR GAMING LG 23.8" FHD IPS (1920X1080) 75HZ, HDMI X1, DP X1, HP-OUT X1', '490.00', 'Monitor Gaming LG 23.8" FHD IPS (1920x1080) 75Hz, HDMI x1, DP x1, HP-Out x1 Relacion de Contraste: 1000:1, Relación de aspecto: 16:9, Brillo: 250 cd/m², Frecuencia de actualización de hasta 75Hz, Tiempo de respuesta: 5ms (GtG at Faster), Consumo de energía (Máx): 18W, Adaptador de poder: 100-240 Vac, 50/60 Hz, Dimensiones: (Ancho x Alto x Prof.) 53.91 cm x 41.43 cm x 21.17 cm / Peso: 3.3 kg.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/4/a/4aa7b3cc3b674ae0859078f27e3d0156_10.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('9', 'SAMSUNG', 'MONITOR SAMSUNG VIEWFINITY S5 34C500, 34" LCD VA, ULTRA-WQHD (3440X1440), HDMIX2/DP/HP-IN', '1240.00', 'Monitor Samsung Viewfinity S5 34C500, 34" LCD VA, Ultra-WQHD (3440x1440), HDMIx2/DP/HP-IN Pantalla Flat, Relacion de aspecto: 21:9, Brillo Tipico: 300 cd/m2, Relacion de contraste (Estatico): 3000:1, Frecuencia de actualizacion: 100Hz (Max), Tiempo de respuesta (ms): 5ms(GTG), Angulo de vision (H/V): 178°/178°, HDR10, Color Frontal: Negro / Color Trasero: Negro, Suministro de Energia interna: AC 100-240V (Adaptador Externo).Dimensiones (Ancho x Alto x Profundidad): 81.53 x 45.77 x 22.13 cm / Peso: 4.9 kg.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/8/4/841d93d5fb7cfc4d75ff23b3736d7520_7.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('9', 'SAMSUNG', 'MONITOR SAMSUNG GAMING ODYSSEY G7 32" LCD IPS, 4K UHD, HDMIX2/DP/HP-IN/LAN/WIFI/BT/USB.', '2860.00', 'Monitor Samsung Gaming Odyssey G7 32" LCD IPS, 4K UHD, HDMIx2/DP/HP-IN/LAN/WiFi/BT/USB. Pantalla Flat, Relacion de aspecto: 16:9, Brillo Tipico: 350 cd/m2, Relacion de contraste (Estatico): 1000:1, Frecuencia de actualizacion: 144Hz (Max), Tiempo de respuesta (ms): 1ms (GTG), Angulo de Vision: 178°(H)/178°(V), Tipo Smart, Sistema Operativo: Tizen, Con Altavoz, Color Frontal: Negro / Color Trasero: Negro, Suministro de Energia: AC 100-240V 50/60Hz (Adaptador Externo).Dimensiones (Ancho x Alto x Profundidad): 71.46 x 60.26 x 31.11 cm / Peso: 8.30 kg.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/a/1/a1bce9b56520062c7a1a76299b9a83d1_8.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('9', 'SAMSUNG', 'MONITOR SAMSUNG VIEWFINITY S6 27B610, 27" LCD IPS, QHD 2K (2560X1440), HDMIX2/DP/HP-IN', '865.00', 'Monitor Samsung Viewfinity S6 27B610, 27" LCD IPS, QHD 2K (2560x1440), HDMIx2/DP/HP-IN Pantalla Flat, Relacion de aspecto: 16:9, Brillo Tipico: 300 cd/m2, Relacion de contraste (Estatico)/(Dinamico): 1000:1 / MEGA, Frecuencia de actualizacion: 75Hz (Max), Tiempo de respuesta (ms): 5ms(GTG), Angulo de vision (H/V): 178°/178°, Color Frontal: Negro / Color Trasero: Negro, Suministro de Energia interna: AC 100-240V (Adaptador Externo).Dimensiones (Ancho x Alto x Profundidad): 61.62 x 53.85 x 19.29 cm / Peso: 5.4 kg.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/8/9/899583e459fcaf0fb19cbbb696707983_9.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('9', 'SAMSUNG', 'MONITOR SAMSUNG LS32AG320NLXPE, 32" LED, 1920 X 1080 VA, HDMI, DP', '995.00', 'Monitor Samsung LS32AG320NLXPE, 32" LED, 1920 x 1080 VA, HDMI, DP Velocidad de refresco: 165Hz, Relacion de Aspecto: 16:9, Brillo: 250cd/m2, Contraste: 3000:1, Relacion de contraste dinamico: Mega, Angulo de vision: 178° / 178°, 100 - 240 VAC.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/b/4/b401c2bde32bfd85392385fd52c5b6a2_5.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('9', 'TEROS', 'MONITOR TEROS TE-2910G, 29" IPS, 2560X1080 WFHD, HDMI, DP, USB , PLANO', '720.00', 'Monitor Teros TE-2910G, 29" IPS, 2560x1080 WFHD, HDMI, DP, USB , Plano Relación de aspecto 16:7, brillo 250 cd/m2, tiempo de respuesta 1 ms, Freesync.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/1/d/1ddcf008b275e6eaa0b095352ebbe712_8.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('9', 'TEROS', 'MONITOR TEROS TE1911S, 19", IPS, 1680X1050, HDMI / VGA / SPEAKER', '250.00', 'Monitor Teros TE1911S, 19", IPS, 1680x1050, HDMI / VGA / Speaker Relación de aspecto 16:9, brillo 200cd/m2, tiempo de respuesta 5 ms, parlante interno, adaptador de energia autovoltaje.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/2/d/2dd16c10d73d192ab834f5226129fc25_9.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('9', 'TEROS', 'MONITOR TEROS TE-2124S, 21.45" IPS, 1920X1080 FULL HD, HDMI / VGA / VESA', '300.00', 'Monitor Teros TE-2124S, 21.45" IPS, 1920x1080 Full HD, HDMI / VGA / VESA Relación de aspecto 16:9, brillo 250 cd/m2, tiempo de respuesta 5ms, auto-voltaje', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/4/e44135fbbe68b799ce93751d2c529fec_5.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('9', 'TEROS', 'MONITOR CURVO GAMING TEROS TE-3214G, 31.5" 2K QHD, 2560 X 1440, HDMI/ DISPLAYPORT/FREESYNC', '970.00', 'Monitor Curvo Gaming Teros TE-3214G, 31.5" 2K QHD, 2560 x 1440, HDMI/ DisplayPort/FREESYNC Relación de aspecto 16:9, brillo 250 cd/m, tiempo de respuesta 1 ms MPRT, velocidad de refresco 165 Hz, Flicker Free, Low Blue Light', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/5/5/5507724b681c6f86d014fdbf29a77da9_6.jpg');

INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('10', 'TEROS', 'FUENTE DE ALIMENTACIÓN TEROS TE7025N, FORMATO ATX, 250W, 115V / 230V.', '45.00', 'Fuente de alimentación Teros TE7025N, Formato ATX, 250W, 115v / 230V.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/5/2/52bbb5f97f80c7b6fbe21e2030ea5800_5.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('10', 'TEROS', 'FUENTE DE ALIMENTACIÓN TEROS TE7026N, FORMATO SFX, 250W, 115V / 230V.', '47.00', 'Fuente de alimentación Teros TE7026N, Formato SFX, 250W, 115v / 230V.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/7/7/77d1bf9cc95f49d5189f2e20423d9eef_4.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('10', 'TEROS', 'FUENTE DE ALIMENTACIÓN CERTIFICADA TE7175 F.MODULAR, ATX, 750W, 80 PLUS GOLD, 100V-240VAC', '240.00', 'Fuente de alimentación CERTIFICADA TE7175 F.Modular, ATX, 750W, 80 Plus Gold, 100V-240VAC 1-Conector ATX/MB 20+4 Pines, 2-Conectores EPS/CPU 4+4 Pines, 4-Conectores PCI-e 8 Pines (6+2), 9-Conectores SATA, 6-Conectores para Periféricos 4 Pines, 2-Conector para Floppy 4 Pines, Fan de 12 cm, 100V ~ 240Vac.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/t/e/te-7175n.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('10', 'MSI', 'FUENTE DE ALIMENTACIÓN MSI MAG A650BN, 650W, 80 PLUS BRONZE CERTIFIED, FORMATO ATX.', '285.00', 'Fuente de alimentación MSI MAG A650BN, 650W, 80 PLUS Bronze Certified, Formato ATX.', 'https://imagenes.deltron.com.pe/images/productos/on-line/items/large/ps/ms/psmsmaga650bn.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('10', 'MSI', 'FUENTE DE ALIMENTACIÓN MSI MAG A750BN PCIE5, 750W, 80 PLUS BRONZE, FORMATO ATX', '320.00', 'Fuente de alimentación MSI MAG A750BN PCIE5, 750W, 80 PLUS Bronze, Formato ATX.', 'https://imagenes.deltron.com.pe/images/productos/on-line/items/large/ps/ms/psmsa750bnpcie5.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('10', 'MSI', 'FUENTE DE ALIMENTACIÓN MSI MAG A850GL PCIE5, 850W, 80 PLUS GOLD, FORMATO ATX.', '490.00', 'Fuente de alimentación MSI MAG A850GL PCIE5, 850W, 80 PLUS Gold, Formato ATX.', 'https://imagenes.deltron.com.pe/images/productos/on-line/items/large/ps/ms/psmsa850glpcie5.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('10', 'MSI', 'FUENTE DE ALIMENTACIÓN MSI MAG A750GL PCIE5, 750W, 80 PLUS GOLD, FORMATO ATX.', '445.00', 'Fuente de alimentación MSI MAG A750GL PCIE5, 750W, 80 PLUS Gold, Formato ATX.', 'https://imagenes.deltron.com.pe/images/productos/on-line/items/large/ps/ms/psmsa750glpcie5.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('10', 'MSI', 'FUENTE DE ALIMENTACIÓN MSI MPG A1000G PCIE5, 1000W, 80 PLUS GOLD, FORMATO ATX.', '825.00', 'Fuente de alimentación MSI MPG A1000G PCIE5, 1000W, 80 PLUS Gold, Formato ATX.', 'https://imagenes.deltron.com.pe/images/productos/on-line/items/large/ps/ms/psmsa1000gpcie5.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('10', 'COOLER_MASTER', 'V850 SFX Gold ATX3.0', '402.00', 'Cooler Master Fuente de alimentación modular completa V850 SFX Gold ATX3.0, 850W SFX, 80+ Gold, conector PCIe 5.0 12VHPWR de 90 grados, soporte SFX a ATX, ventilador silencioso, garantía de 10 años', 'https://m.media-amazon.com/images/I/71aKQ2Cwd+L._AC_UY218_.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('10', 'COOLER_MASTER', 'MPG-8501-AFBAP-XUS', '546.00', 'Cooler Master XG850 Plus Platinum ARGB totalmente modular, 850W, panel de visualización de información incorporado, ventilador silencioso ARGB 5.315 in, Intel ATX 12V Ver 2.53, condensadores 100%', 'https://m.media-amazon.com/images/I/81x1V41CY-L._AC_UY218_.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('10', 'COOLER_MASTER', 'V750 SFX Oro Blanco', '670.00', 'Cooler Master V750 SFX Gold White Edition Full Modular, 750 W, 80+ eficiencia Gold, soporte ATX incluido, ventilador FDB silencioso, factor de forma SFX, garantía de 10 años', 'https://m.media-amazon.com/images/I/71lnEvOUtjS._AC_UY218_.jpg');
INSERT INTO `tabla_producto` (`ID_Categoria`, `Marca_Producto`, `Nombre_Producto`, `Precio_Producto`, `Descripcion_Producto`, `Imagen_Producto`)
VALUES ('10', 'COOLER_MASTER', 'GX III Gold 850W ATX3.0', '505.00', 'Cooler Master GX III Gold 850W ATX3.0 Fuente de alimentación modular completa, 850W, 80+ Gold, conector PCIe 5.0 12VHPWR de 90 grados, ventilador silencioso | Zero-RPM, garantía de 10 años', 'https://m.media-amazon.com/images/I/81eVOH-OKeL._AC_UY218_.jpg');

INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('1', 'MOTHERBOARD GIGABYTE X670 AORUS ELITE AX, CHIPSET AMD X670, SOCKET AMD AM5, ATX', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/a/7/a725b527f6868780b65fa957ffe35135_3.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('2', 'MOTHERBOARD GIGABYTE Z790 AORUS ELITE AX (REV. 1.0), CHIPSET INTEL Z790, LGA1700, ATX', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/9/4/94d414f45aef292e63c5c3b69453a1c5_3.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('3', 'MOTHERBOARD MSI PRO B650-P WIFI, CHIPSET AMD B650, SOCKET AMD AM5, ATX', 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/4302/PMP20000140056/full_image-1.jpeg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('4', 'MOTHERBOARD MSI MAG Z790 TOMAHAWK WIFI, CHIPSET INTEL Z790, LGA1700, ATX', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/9/7/97edd36ae833f204257df14c69f34aaa_3.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('5', 'MOTHERBOARD MSI MAG B650 TOMAHAWK WIFI, CHIPSET AMD B650, SOCKET AMD AM5, ATX', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/2/3/23f189881861bfee5b0a5653be6de846_3.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('6', 'MOTHERBOARD ASUS PRIME X670-P, CHIPSET AMD X670, SOCKET AMD AM5, ATX', 'https://www.aibitech.com/86906-large_default/motherboard-asus-prime-x670-p-chipset-amd-x670-socket-amd-am5-atx.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('7', 'MOTHERBOARD ASUS ROG CROSSHAIR X670E HERO, CHIPSET AMD X670, SOCKET AMD AM5, ATX', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/f/6/f6b07bbca2734240202b6a954e3f9520.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('8', 'MOTHERBOARD MSI PRO Z790-P WIFI, CHIPSET INTEL Z790, LGA1700, ATX', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/5/3/53ff8d65d5599f7ba752202f279bab9d_4.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('9', 'MOTHERBOARD ASUS ROG STRIX B650E-E GAMING WIFI, CHIPSET AMD B650, SOCKET AMD AM5, ATX', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/f/c/fc07480f1364d6d3d2d4ba289b7e364c_2.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('10', 'MOTHERBOARD ASUS ROG STRIX B650-A GAMING WIFI, CHIPSET AMD B650, SOCKET AMD AM5, ATX', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/7/2/72b10f5d68e29beca7daf459808d7884_3.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('11', 'MOTHERBOARD MSI PRO Z790-A MAX WIFI, CHIPSET INTEL Z790, LGA1700, HDMI, DP, ATX', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/9/8/98c19c652a995add6b7cc85714fbdbfe_2.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('12', 'MOTHERBOARD ASUS TUF GAMING B550-PLUS WIFI II, CHIPSET AMD B550, SOCKET AMD AM4, ATX', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/a/f/afb58d60c1adc8d22a9cca938ff60a72_2.jpg');

INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('13', 'PROCESADOR AMD RYZEN 5 4600G, 3.70 / 4.20GHZ, 8MB L3, 6 CORE, AM4, 7NM, 65W.', 'https://falabella.scene7.com/is/image/FalabellaPE/gsc_130105463_5813361_1?wid=800&hei=800&qlt=70');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('14', 'PROCESADOR AMD RYZEN 5 4500, 3.6 / 4.1 GHZ, 8MB L3, 6-CORE, AM4, 7NM, 65W.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/0/8/08046f11276ba61925307eb7a97ff4ed_24.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('15', 'PROCESADOR INTEL CORE I3-12100 3.3 / 4.3GHZ 12MB INTEL SMART CACHÉ, LGA1700, INTEL 7(10NM)', 'https://falabella.scene7.com/is/image/FalabellaPE/gsc_131919279_6205542_1?wid=1500&hei=1500&qlt=70');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('16', 'PROCESADOR AMD RYZEN 7 5700X, 3.40 / 4.60GHZ, 32MB L3 CACHE, 8-CORE, AM4, 7NM, 65W.', 'https://imagenes.deltron.com.pe/images/productos/on-line/items/large/cp/am/cpam4r75700x.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('17', 'PROCESADOR AMD RYZEN 5 5600, 3.50 / 4.40 GHZ, 32MB L3 CACHE, 6-CORES, AM4, 7NM, 65W.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/e/3/e3e44981f6cdc6e919856547794e975f_24.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('18', 'PROCESADOR AMD RYZEN 5 5500, 3.60 / 4.20 GHZ, 16MB L3 CACHE, 6-CORES, AM4, 7NM, 65W.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/d/4/d4134f95e8c8857679c742c700717900_22.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('19', 'PROCESADOR AMD RYZEN 5 PRO 4650G, 3.70 / 4.20GHZ, 8MB L3, 6-CORE, AM4, 7NM, 65W.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/3/a/3a0da3d0d33b9d2c4b50f74fbf0f9870_7.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('20', 'PROCESADOR INTEL CORE I7-12700 2.10/4.90GHZ, 25MB SMARTCACHÉ, LGA1700, 180W, INTEL 7(10NM)', 'https://www.aibitech.com/81095-large_default/procesador-intel-core-i7-12700-160490ghz-25mb-smartcach%C3%A9-lga1700-180w-intel-710nm.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('21', 'PROCESADOR INTEL CORE I7-12700F, 2.10 / 4.90GHZ, 25MB SMARTCACHÉ, LGA1700, INTEL 7(10NM)', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/7/e/7ecaab40413587c8178a5a8b783cdcc1_14.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('22', 'PROCESADOR INTEL CORE I5-12400, 2.50/4.40GHZ 18MB SMARTCACHÉ, LGA1700, 117W, INTEL 7(10NM)', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/c/1/c1ab7314bb8a33b88c7436dfbffc2cb9_7.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('23', 'PROCESADOR INTEL CORE I9-12900 2.40 / 5.10GHZ 30 MB INTEL SMART CACHÉ LGA1700, 65W/202W', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/4/b/4b0800b50b5bd0aa7bfc55f8c3ad49d3_5.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('24', 'PROCESADOR INTEL CORE I5-10400F, 2.90 GHZ, 12 MB CACHÉ L3, LGA1200, 65W, 14 NM.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/e/0/e0a20c4c2eec32426502ecf78a111c0f_20.jpg');

INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('25', 'TARJETA DE VIDEO ASUS PHOENIX GEFORCE RTX 3060 V2 12GB GDDR6, PCI EXPRESS 4.0', 'https://supertec.com.pe/img-apps/productos/T_VIDEO-ASUS-NVIDIA--DUAL-PHOENIX--RTX3060-V2-12GB-1.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('26', 'TARJETA DE VIDEO ASUS DUAL GEFORCE GTX 1650 4GB GDDR6 EVO, PCI EXPRESS 3.0', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/2/a/2a7c8694b81c092d99970e3504765d6a_2.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('27', 'TARJETA DE VIDEO MSI GEFORCE GTX 1650 D6 VENTUS XS OCV3, 4GB GDDR6, PCIE GEN 3.0 X16', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/5/b/5b8a6cf0b32dccfd7de8af0baca4b61e_2.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('28', 'TARJETA DE VIDEO GIGABYTE GEFORCE RTX 4060 TI AERO OC 16G, 16GB GDDR6, PCI-E 4.0', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/0/0/00852bb03ec6c124e93f4df18e8459c0_2.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('29', 'TARJETA DE VIDEO ASUS DUAL GEFORCE RTX 4060 OC EDITION 8GB GDDR6 PCI-E 4.0 COLOR BLANCO', 'https://moqueguanita.pe/wp-content/uploads/2024/01/Tarjeta-de-Video-ASUS-Dual-GeForce-RTX-4060-OC-Edition-8GB-GDDR6-PCI-E-4.0-Color-Blanco.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('30', 'TARJETA DE VIDEO MSI GEFORCE RTX 4060 TI GAMING X SLIM WHITE, 16GB GDDR6, PCIE GEN 4.0 X8', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/f/1/f184153ddf51db1a3ed84f983f009bfd.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('31', 'TARJETA DE VIDEO MSI GEFORCE GT 1030 4GD4 LP OC, 4GB DDR4, PCIE GEN 3.0 X16 (UTILIZA X4)', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/4/b/4b5b76184aeb35da3b37a419a1bec47d.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('32', 'TARJETA DE VIDEO ASUS ROG STRIX GEFORCE RTX 4070 SUPER 12GB GDDR6X OC EDITION, PCIE 4.0', 'https://dlcdnwebimgs.asus.com/gain/EFF9D6D8-2F6C-4E76-989F-E5DB594052BA/w717/h525');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('33', 'TARJETA DE VIDEO ASUS TUF GAMING GEFORCE RTX 4070TI SUPER 16GB GDDR6X OC EDITION, PCIE 4.0', 'https://cyccomputer.pe/55503-large_default/asus-geforce-rtx-4070ti-super-16gb-gddr6x-256bits-tuf-gaming-oc-pn90yv0kf1-mvaa00.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('34', 'VGA 16G MS RTX4080SUP GMG SLIM', 'https://cyccomputer.pe/55739-large_default/msi-geforce-rtx-4080-super-16gb-gddr6x-256bits-gaming-x-slim-oc-pn912-v511-257.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('35', 'VGA 8G GB RX7600 GAMING OC GD6', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/8/4/8498d70ebf2809a8b43b94cc9bf47129.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('36', 'TARJETA DE VIDEO GIGABYTE GEFORCE RTX 4090 GAMING OC 24G, 24GB GDDR6X, PCI-E 4.0X16', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/0/f/0f9b94cb5827673a4d6fc31501f47332.jpg');

INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('37', 'MEMORIA TEAMGROUP DELTA TUF GAMING ALLIANCE RGB, 16GB DDR5-5200MHZ PC5-41600, CL40, 1.25V', 'https://imagenes.deltron.com.pe/images/productos/on-line/items/large/me/16/me16tfdt5200hc4.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('38', 'MEMORIA DIMM KINGSTON FURY BEAST WHITE, 16GB DDR5-5200MHZ PC5-41600, CL40, 1.25V, NON-ECC', 'https://falabella.scene7.com/is/image/FalabellaPE/gsc_128573406_5248885_1?wid=1500&hei=1500&qlt=70');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('39', 'MEMORIA KINGSTON FURY BEAST 32GB DDR5-5200MHZ, PC5-41600, CL40, 1.25V, 288-PIN, NON-ECC', 'https://imagenes.deltron.com.pe/images/productos/on-line/items/large/me/32/me32gkf552c40rg.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('40', 'MEMORIA DIMM KINGSTON FURY BEAST WHITE EXPO, 16GB DDR5-5200MHZ PC5-41600, CL36, 1.25V', 'https://imagenes.deltron.com.pe/images/productos/on-line/items/large/me/16/me16kf552c40bwe.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('41', 'MEM RAM 16G TF VULC SOD 5.20GZ', 'https://gpperu.com/img/datasheet/ME16TFVS5200HC3_LARGE.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('42', 'MEMORIA KINGSTON FURY BEAST WHITE RGB, 16GB DDR5-5200 MHZ, CL-40, 1.25V, WHITE', 'https://imagenes.deltron.com.pe/images/productos/on-line/items/large/me/16/me16kf552bwrgb.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('43', 'MEMORIA TEAMGROUP T-FORCE VULCAN Z DDR4, 32GB DDR4-3200MHZ, CL-16, 1.35V, GRIS.', 'https://imagenes.deltron.com.pe/images/productos/on-line/items/large/me/32/me32gtfvz3200dg.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('44', 'MEMORIA TEAMGROUP T-FORCE DELTA RGB, 32GB DDR4-3200MHZ, CL-16, 1.35V, NEGRO.', 'https://imagedelivery.net/4fYuQyy-r8_rpBpcY7lH_A/falabellaPE/129778400_1/w=800,h=800');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('45', 'MEMORIA TEAMGROUP T-FORCE DELTA RGB DDR5, 16GB DDR5-5200MHZ, PC5-41600, CL40, 1.25V', 'https://falabella.scene7.com/is/image/FalabellaPE/gsc_128961265_5408926_1?wid=1500&hei=1500&qlt=70');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('46', 'MEMORIA TEAMGROUP T-FORCE DELTA RGB DDR5 16GB DDR5-5200 MHZ, CL40, 1.25V', 'https://falabella.scene7.com/is/image/FalabellaPE/gsc_128960668_5408512_1?wid=1500&hei=1500&qlt=70');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('47', 'MEMORIA DIMM KINGSTON FURY RENEGADE 8GB DDR4-3600MHZ PC4-28800, CL16, 1.35V, 288-PIN, RGB', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/2/8/283ce0f75d698713d7e6b0bf983e4ac3_1.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('48', 'MEMORIA KINGSTON FURY BEAST 32GB DDR4-3200MHZ PC4-25600, CL16, 1.35V, 288-PIN, RGB, DIMM', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/b/7/b7c3a39b147d72dcb054c85a9efb7e11_3.jpg');

INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('49', 'EL TECLADO MECÁNICO DE JUEGO CORSAIR K60 RGB PRO LOW PROFILE - CHERRY MX LOW PROFILE SPEED', 'https://cdn.gidat.pe/images/31636260-c710-4abf-8158-e832f43a54cf/teclado-corsair-ch-910d018-sp-rgb-pro-low-profile-mx-low-profile-speed.jpg?fm=jpg&q=80&fit=max&crop=1080%2C1080%2C0%2C0&w=1080&h=1080');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('50', 'TECLADO MECÁNICO PARA JUEGOS K60 PRO - LED ROJO. INTERRUPTORES 100% - CHERRY MV - NEGRO', 'https://www.impacto.com.pe/storage/products/md/167545460256418.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('51', 'TECLADO MECÁNICO PARA JUEGOS CORSAIR K70 RGB MK.2 SE - CHERRY MX SPEED', 'https://fjcomputo.pe/8457-large_default/teclado-mecanico-para-juegos-corsair-k70-rgb-mk-2-se-cherry-mx-speed.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('52', 'TECLADO DE ENTRETENIMIENTO CORSAIR K83 WIRELESS', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/3/f/3f27f906701c1f3f45a06682f7c73534_6.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('53', 'TECLADO INALAMBRICO PARA JUEGOS CORSAIR K57 RGB WIRELESS', 'https://i.ebayimg.com/images/g/jd0AAOSwOZBdX8lX/s-l1600.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('54', 'TECLADO MECÁNICO PARA JUEGO CORSAIR STRAFE RGB MK.2 CHERRY MX RED (SP), USB 2.0', 'https://falabella.scene7.com/is/image/FalabellaPE/gsc_129317681_5551319_1?wid=800&hei=800&qlt=70');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('55', 'TECLADO MECÁNICO PARA JUEGOS CORSAIR K95 RGB PLATINUM XT  CHERRY MX SPEED (NA LAYOUT)', 'https://falabella.scene7.com/is/image/FalabellaPE/gsc_124531353_4023728_1?wid=1500&hei=1500&qlt=70');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('56', 'TECLADO MULTIMEDIA TEROS, TE-4067S,USB 2.0, NEGRO', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/f/c/fc9004499035329d0e5c3ab7b919685b_8.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('57', 'TECLADO INALAMBRICOTEROS TE-4066G, MULTIMEDIA, CON ILUMINACIÓN RGB BACKLIT', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/a/2/a23b2dbe9265dd75eafee0b5d2cc2dec_12.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('58', 'TECLADO GAMER TEROS TE-4153, MECÁNICO, MULTIMEDIA, ILUMINACIÓN RGB, TKL, USB.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/f/5/f51bd10684f18f4dd05a80d81cebd3d2_15.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('59', 'TECLADO GAMER TEROS TE-4152, MECÁNICO, MULTIMEDIA, ILUMINACIÓN RGB, 105 TECLAS, USB.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/4/6/46c4ca9a6bd1cccb0225b39b438e7e9c_13.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('60', 'TECLADO TEROS, TE-4065N, SELLADO, LAVABLE, A PRUEBA DE AGUA, IPX7, USB, NEGRO', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/a/9/a9c557fc7d72193be1ac5e18495c2800_12.jpg');

INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('61', 'DIMENSIONES 450*400*3 MM', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/a/d/ad860e1bc21bc766b283f948ef152425.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('62', 'MOUSE ÓPTICO INALÁMBRICO TEROS TE5075Y, COLOR NEGRO / AMARILLO, 1600 DPI, RECEPTOR USB.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/e/b/eb1a874b3544b6f0a4f04cc7c720ffce_8.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('63', 'MOUSE ÓPTICO TEROS TE-5076N, 1600DPI, , USB, 4 BOTONES,', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/2/e/2ed71d500688ab25881cdcc1bcacb237_8.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('64', 'MOUSE ÓPTICO TEROS TE-5162N, 6400DPI, RGB, USB, 6 BOTONES, PRESENTACIÓN EN COLGADOR', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/7/3/73e5bacb86559fb750e604b3c0b733b1_14.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('65', 'MOUSE ÓPTICO TEROS TE-5164N, 6400DPI, RGB, USB, 7 BOTONES, PRESENTACIÓN EN COLGADOR', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/t/e/te-5164.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('66', 'MOUSE PAD GAMING CORSAIR MM800 POLARIS RGB, 26.00 X 35.00 CM, 5 MM, USB.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/3/4/34c8a4346c9369dc176a2e091213fc98_16.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('67', 'MOUSE ÓPTICO CORSAIR M65 RGB ELITE FPS GAMING, 18 000 DPI, USB, 9 BOTONES, NEGRO.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/3/1/318bc0453441209ddc262ad60ff4363c_15.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('68', 'MOUSE ÓPTICO CORSAIR M65 RGB ELITE FPS GAMING, 18 000 DPI, USB, 9 BOTONES, BLANCO.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/6/6/665864ccbbc1099b9385fc63a947fe7a_14.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('69', 'MOUSE ÓPTICO CORSAIR IRONCLAW RGB GAMING, 18 000 DPI, 7 BOTONES, NEGRO, USB.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/7/0/7081077f327ad023fe45e41dfb229b7b_15.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('70', 'MOUSE GAMER CORSAIR GLAIVE RGB PRO, ALUMÍNIO.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/5/1/51z2tj6ln_l._ac_ss450_.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('71', 'MOUSE GAMER TE-1210G DISEÑO DEL AGUJERO MEJOR RATÓN PARA JUEGOS CON CABLE', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/c/6/c69f90127c995872f8d3134b5baddad7_9.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('72', 'MOUSE PARA JUEGOS CORSAIR INALÁMBRICO DARK CORE RGB PRO', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/9/4/943d81c601e1c07b6080298122bc4d37_8.jpg');

INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('73', 'FAN CORSAIR SERIES LL140 RGB DUAL LED, 14 CM, 1 600 RPM, 12VDC, 4 PINES.', 'https://imagenes.deltron.com.pe/images/productos/on-line/items/large/ac/co/accorll140rgb.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('74', 'FAN CORSAIR ML140 PRO RGB LED, 14 CM, 1200 RPM, 13.2 VDC, 4 PINES, PWM CONTROL.', 'https://falabella.scene7.com/is/image/FalabellaPE/gsc_124015853_3820482_1?wid=800&hei=800&qlt=70g');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('75', 'CASE GAMER TEROS TE-1173N, MID TOWER, ATX, USB 3.0 / 2.0, AUDIO.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/e/b/ebf5a30ca300d018e7ed8b6959b98bac_3.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('76', 'CASE GAMER TEROS TE1174N, MID TOWER, NEGRO, USB 3.0, USB 2.0, AUDIO.', 'https://imagenes.deltron.com.pe/images/productos/on-line/items/large/cs/at/csatxte1174n.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('77', 'CASE GAMER MSI MAG FORGE M100A', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/1/d/1dd587d6d9741aa7046de08846fcfd6f_3.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('78', 'CASE GAMER TEROS TE1172N, MID TOWER, NEGRO, USB 3.0, USB 2.0, AUDIO.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/8/3/835a947c0602c1c3b6703d472afd5227_3.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('79', 'CASE GAMER TEROS TE1163N, NEGRO, USB 3.0, USB 2.0, AUDIO FAN ARGB', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/f/8/f8d735003b63e57882687ce84eee6079_8.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('80', 'CASE GAMER TEROS TE-1165N, MID TOWER, NEGRO, USB 3.0 / 2.0, AUDIO.', 'https://imagenes.deltron.com.pe/images/productos/on-line/items/large/cs/at/csatxte1165n01_2.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('81', 'CASE GIGABYTE C200 GLASS, MID TOWER, ATX, RGB, USB 3.0, NO INCLUYE FUENTE DE PODER', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/e/5/e5726fbad11112bcd08635999254fbea_2.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('82', 'CASE ASUS TUF GAMING GT502, MID-TOWER, ATX, BLANCO.', 'https://rimage.ripley.com.pe/home.ripley/Attachment/MKP/4302/PMP20000141125/imagen2-1.jpeg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('83', 'CASE TEROS TE1076N, MID TOWER, ATX, 250W, USB 3.0 / 2.0, AUDIO, NEGRO.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/7/d/7dcd95ba05bcbb6a515ee07159605c03_6.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('84', 'CASE TEROS TE1075N, MID TOWER, ATX, 250W, USB 3.0 / 2.0, AUDIO, NEGRO.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/6/4/647c6bfbdf3a01dfe7626ed986b718f3_5.jpg');

INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('85', 'UNIDAD EN ESTADO SOLIDO KINGSTON FURY RENEGADE 500GB, M.2 2280 PCIE 4.0 NVME.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/0/4/047c9cb69a3ce30add84a71920b512f5_5.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('86', 'UNIDAD EN ESTADO SOLIDO KINGSTON FURY RENEGADE 1TB, M.2 2280 PCIE 4.0 NVME.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/7/1/71b879bc93e99e5a948cb0dc79116928_4.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('87', 'UNIDAD EN ESTADO SOLIDO KINGSTON KC3000, 4096GB, M.2 2280 PCIE GEN 4.0 NVME', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/6/1/61f890edefbc9918dbf9c40132290f0b_3.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('88', 'UNIDAD EN ESTADO SOLIDO KINGSTON KC3000, 2048GB, M.2 2280 PCIE GEN 4.0 NVME', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/f/9/f97c6c3db41565082b62992f1804aff6_5.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('89', 'UNIDAD EN ESTADO SOLIDO KINGSTON KC3000, 512GB, M.2 2280 PCIE GEN 4.0 NVME', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/c/8/c84501731d1a422906a72074060c48c5_5.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('90', 'UNIDAD EN ESTADO SOLIDO KINGSTON KC600, 1024GB, SATA REV 3.0 (6 GB/S)', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/3/0/30274ff5b95fdcfa819fd2c5302be6df_5.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('91', 'UNIDAD EN ESTADO SOLIDO WESTERN DIGITAL BLUE SA510, 250GB, SATA 6GB/S, 2.5", 7MM.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/a/4/a41e479690e6366395c175e6211caa92_9.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('92', 'UNIDAD EN ESTADO SOLIDO WESTERN DIGITAL BLUE SA510, 1TB, SATA 6GB/S, 2.5", 7MM.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/5/c/5cdf02fc707230c12baee7f1975eea1f_3.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('93', 'UNIDAD DE ESTADO SOLIDO WESTERN DIGITAL GREEN, WDS240G3G0A, 240GB, SATA 6GB/S, 2.5", 7MM.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/1/6/1606715d5158b3a1bd49f83371d5b4a6_21.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('94', 'UNIDAD DE ESTADO SOLIDO WESTERN DIGITAL GREEN, WDS480G3G0A, 480GB, SATA 6GB/S, 2.5", 7MM.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/5/f/5f14511cba6c5fdc94e95ca7e4200168_12.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('95', 'DISCO DURO WESTERN DIGITAL RED PLUS WD80EFZZ, 8TB, SATA, 5640RPM, 3.5", CACHE 128MB', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/8/f/8f713f8d87cb30b4ec03cc1c9a336c9f_6.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('96', 'DISCO DURO WESTERN DIGITAL RED PLUS WD20EFZX, 2TB, SATA, 5400RPM, 3.5", CACHE 128MB', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/4/a/4afd59069528644575b0d7bfdc7b9d43_13.jpg');

INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('97', 'MONITOR GAMING LG 31.5" QHD IPS (2560X1440) 165HZ, HDMI X1, DP X1, HP-OUT X1', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/e/b/ebe62be37278d74edf96f2f674177e21_4.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('98', 'MONITOR GAMING LG 27" ULTRAGEAR, UHD 4K IPS (3840X2160) 144HZ, HDMI X2, DP X1, HP-OUT X1', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/5/9/594fb01c9d9bb6ea39d17063359a73b2_5.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('99', 'MONITOR GAMING LG 27" ULTRAGEAR, QHD IPS (2560X1440) 165HZ, HDMI X2, DP X1, HP-OUT X1', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/b/9/b95817f41a637c8c0cef57bb0efeaa53.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('100', 'MONITOR GAMING LG 23.8" FHD IPS (1920X1080) 75HZ, HDMI X1, DP X1, HP-OUT X1', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/4/a/4aa7b3cc3b674ae0859078f27e3d0156_10.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('101', 'MONITOR SAMSUNG VIEWFINITY S5 34C500, 34" LCD VA, ULTRA-WQHD (3440X1440), HDMIX2/DP/HP-IN', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/8/4/841d93d5fb7cfc4d75ff23b3736d7520_7.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('102', 'MONITOR SAMSUNG GAMING ODYSSEY G7 32" LCD IPS, 4K UHD, HDMIX2/DP/HP-IN/LAN/WIFI/BT/USB.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/a/1/a1bce9b56520062c7a1a76299b9a83d1_8.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('103', 'MONITOR SAMSUNG VIEWFINITY S6 27B610, 27" LCD IPS, QHD 2K (2560X1440), HDMIX2/DP/HP-IN', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/8/9/899583e459fcaf0fb19cbbb696707983_9.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('104', 'MONITOR SAMSUNG LS32AG320NLXPE, 32" LED, 1920 X 1080 VA, HDMI, DP', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/b/4/b401c2bde32bfd85392385fd52c5b6a2_5.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('105', 'MONITOR TEROS TE-2910G, 29" IPS, 2560X1080 WFHD, HDMI, DP, USB , PLANO', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/1/d/1ddcf008b275e6eaa0b095352ebbe712_8.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('106', 'MONITOR TEROS TE1911S, 19", IPS, 1680X1050, HDMI / VGA / SPEAKER', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/2/d/2dd16c10d73d192ab834f5226129fc25_9.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('107', 'MONITOR TEROS TE-2124S, 21.45" IPS, 1920X1080 FULL HD, HDMI / VGA / VESA', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/e/4/e44135fbbe68b799ce93751d2c529fec_5.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('108', 'MONITOR CURVO GAMING TEROS TE-3214G, 31.5" 2K QHD, 2560 X 1440, HDMI/ DISPLAYPORT/FREESYNC', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/5/5/5507724b681c6f86d014fdbf29a77da9_6.jpg');

INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('109', 'FUENTE DE ALIMENTACIÓN TEROS TE7025N, FORMATO ATX, 250W, 115V / 230V.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/5/2/52bbb5f97f80c7b6fbe21e2030ea5800_5.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('110', 'FUENTE DE ALIMENTACIÓN TEROS TE7026N, FORMATO SFX, 250W, 115V / 230V.', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/7/7/77d1bf9cc95f49d5189f2e20423d9eef_4.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('111', 'FUENTE DE ALIMENTACIÓN CERTIFICADA TE7175 F.MODULAR, ATX, 750W, 80 PLUS GOLD, 100V-240VAC', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/584975/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/t/e/te-7175n.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('112', 'FUENTE DE ALIMENTACIÓN MSI MAG A650BN, 650W, 80 PLUS BRONZE CERTIFIED, FORMATO ATX.', 'https://imagenes.deltron.com.pe/images/productos/on-line/items/large/ps/ms/psmsmaga650bn.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('113', 'FUENTE DE ALIMENTACIÓN MSI MAG A750BN PCIE5, 750W, 80 PLUS BRONZE, FORMATO ATX', 'https://imagenes.deltron.com.pe/images/productos/on-line/items/large/ps/ms/psmsa750bnpcie5.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('114', 'FUENTE DE ALIMENTACIÓN MSI MAG A850GL PCIE5, 850W, 80 PLUS GOLD, FORMATO ATX.', 'https://imagenes.deltron.com.pe/images/productos/on-line/items/large/ps/ms/psmsa850glpcie5.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('115', 'FUENTE DE ALIMENTACIÓN MSI MAG A750GL PCIE5, 750W, 80 PLUS GOLD, FORMATO ATX.', 'https://imagenes.deltron.com.pe/images/productos/on-line/items/large/ps/ms/psmsa750glpcie5.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('116', 'FUENTE DE ALIMENTACIÓN MSI MPG A1000G PCIE5, 1000W, 80 PLUS GOLD, FORMATO ATX.', 'https://imagenes.deltron.com.pe/images/productos/on-line/items/large/ps/ms/psmsa1000gpcie5.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('117', 'V850 SFX Gold ATX3.0', 'https://m.media-amazon.com/images/I/71aKQ2Cwd+L._AC_SL1500_.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('118', 'MPG-8501-AFBAP-XUS', 'https://m.media-amazon.com/images/I/81x1V41CY-L._AC_SL1500_.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('119', 'V750 SFX Oro Blanco', 'https://m.media-amazon.com/images/I/71lnEvOUtjS._AC_SL1500_.jpg');
INSERT INTO `tabla_imagen_calidad` (`ID_Producto`, `Nombre_Imagen_Calidad`, `Img_Imagen_Calidad`)
VALUES ('120', 'GX III Gold 850W ATX3.0', 'https://m.media-amazon.com/images/I/81eVOH-OKeL._AC_SL1500_.jpg');

SELECT ID_Usuario, Fecha_Venta, Direccion_Venta, TP.Nombre_Producto, TDV.Precio_Detalle_Venta, TDV.Cantidad_Detalle_Venta, Estatus_Venta
FROM tabla_venta TV INNER JOIN tabla_detalle_venta TDV ON TV.ID_Venta = TDV.ID_Venta
INNER JOIN tabla_producto TP ON TDV.ID_Producto = TP.ID_Producto WHERE ID_Usuario ='3';