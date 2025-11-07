# 🧾 Recyclon — Gestión de Productos y Pedidos

Aplicación web desarrollada con **Jakarta EE**, **JPA** y **Bootstrap 5**, orientada a la gestión interna de productos reciclados y sostenibles para oficina. Este proyecto forma parte de la **Actividad 04** del curso.

## 📦 Descripción General

**Recyclon** es una empresa dedicada a la comercialización de productos de oficina reciclados. Esta aplicación permite:

- Visualizar el catálogo de productos.
- Gestionar pedidos de clientes.
- Administrar productos y categorías.
- Consultar información relevante mediante consultas JPQL.

> ⚠️ La aplicación **no incluye** pasarelas de pago ni proceso de compra online. Está centrada en la gestión interna.

---

## 🧱 Arquitectura del Proyecto

- **Patrón MVC clásico**:
  - **Controlador principal**: `ControladorRecyclon` (Servlet único con parámetro `accion`)
  - **Modelo**: Entidades JPA y clases de negocio.
  - **Vista**: JSP con Bootstrap 5.
- **Persistencia**:
  - JPA con unidad de persistencia `recyclonPU`.
  - Base de datos compatible con el modelo Pubs (MySQL/PostgreSQL).

---

## 🗃️ Entidades Principales

- **Producto**
  - Nombre, descripción, precio, stock.
  - Relación ManyToOne con Categoría.
- **Categoría**
  - Nombre y descripción.
  - Relación OneToMany con Producto.
- **Pedido**
  - Fecha, cliente/responsable.
  - Lista de líneas de pedido.
- **LíneaPedido**
  - Producto, cantidad, precio unitario.
  - Relación con Pedido y Producto.

---

## ⚙️ Funcionalidades

### Productos
- Listado completo con filtro por categoría.
- Alta, modificación y baja.

### Pedidos
- Registro de nuevos pedidos.
- Consulta de pedidos existentes y su estado.

### Consultas JPQL
- Productos con stock bajo.
- Pedidos por fecha o mes.
- Total de ventas por categoría.

---

## 🎨 Interfaz Visual

- Bootstrap 5 para diseño responsive.
- Uso de componentes como:
  - Navbars
  - Cards
  - Tablas con sombras
  - Modales
  - Alerts e iconos

---

## 🚀 Despliegue

### Requisitos
- Servidor compatible con Jakarta EE (GlassFish, Payara, WildFly).
- Base de datos MySQL o PostgreSQL.
- JDK 17+ recomendado.

